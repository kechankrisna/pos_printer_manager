import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:flutter_usb_printer/flutter_usb_printer.dart';
import 'package:pos_printer_manager/models/usb_printer.dart';
import 'package:win32/win32.dart';
import 'package:pos_printer_manager/enums/connection_response.dart';
import 'package:pos_printer_manager/models/pos_printer.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';
import 'package:pos_printer_manager/services/printer_manager.dart';

import 'usb_service.dart';

/// USB Printer
class USBPrinterManager extends PrinterManager {
  Generator generator;

  /// usb_serial
  var usbPrinter = FlutterUsbPrinter();

  /// [win32]
  Pointer<IntPtr> phPrinter = calloc<HANDLE>();
  Pointer<Utf16> pDocName = 'My Document'.toNativeUtf16();
  Pointer<Utf16> pDataType = 'RAW'.toNativeUtf16();
  Pointer<Uint32> dwBytesWritten = calloc<DWORD>();
  Pointer<DOC_INFO_1> docInfo;
  Pointer<Utf16> szPrinterName;
  int hPrinter;
  int dwCount;

  USBPrinterManager(
    POSPrinter printer,
    PaperSize paperSize,
    CapabilityProfile profile, {
    int spaceBetweenRows = 5,
    int port: 9100,
  }) {
    assert(printer != null);
    super.printer = printer;
    super.address = printer.address;
    super.productId = printer.productId;
    super.deviceId = printer.deviceId;
    super.vendorId = printer.vendorId;
    super.paperSize = paperSize;
    super.profile = profile;
    super.spaceBetweenRows = spaceBetweenRows;
    super.port = port;
    generator =
        Generator(paperSize, profile, spaceBetweenRows: spaceBetweenRows);
  }

  @override
  Future<ConnectionResponse> connect(
      {Duration timeout: const Duration(seconds: 5)}) async {
    if (Platform.isWindows) {
      try {
        docInfo = calloc<DOC_INFO_1>()
          ..ref.pDocName = pDocName
          ..ref.pOutputFile = nullptr
          ..ref.pDatatype = pDataType;
        szPrinterName = printer.name.toNativeUtf16();

        final phPrinter = calloc<HANDLE>();
        if (OpenPrinter(szPrinterName, phPrinter, nullptr) == FALSE) {
          PosPrinterManager.logger.error("can not open");
          this.isConnected = false;
          this.printer.connected = false;
        } else {
          PosPrinterManager.logger.info("szPrinterName: $szPrinterName");
          this.hPrinter = phPrinter.value;
          this.isConnected = true;
          this.printer.connected = true;
        }

        return Future<ConnectionResponse>.value(ConnectionResponse.success);
      } catch (e) {
        this.isConnected = false;
        this.printer.connected = false;
        return Future<ConnectionResponse>.value(ConnectionResponse.timeout);
      }
    } else if (Platform.isAndroid) {
      var usbDevice = await usbPrinter.connect(vendorId, productId);
      if (usbDevice != null) {
        print("vendorId $vendorId, productId $productId ");
        this.isConnected = true;
        this.printer.connected = true;
        return Future<ConnectionResponse>.value(ConnectionResponse.success);
      } else {
        this.isConnected = false;
        this.printer.connected = false;
        return Future<ConnectionResponse>.value(ConnectionResponse.timeout);
      }
    } else {
      return Future<ConnectionResponse>.value(ConnectionResponse.timeout);
    }
  }

  /// [discover] let you explore all netWork printer in your network
  static Future<List<USBPrinter>> discover() async {
    var results = await USBService.findUSBPrinter();
    return results;
  }

  @override
  Future<ConnectionResponse> disconnect({Duration timeout}) async {
    if (Platform.isWindows) {
      // Tidy up the printer handle.
      ClosePrinter(hPrinter);
      free(phPrinter);
      free(pDocName);
      free(pDataType);
      free(docInfo);
      free(dwBytesWritten);
      this.isConnected = false;
      this.printer.connected = false;
      if (timeout != null) {
        await Future.delayed(timeout, () => null);
      }
      return ConnectionResponse.success;
    } else if (Platform.isAndroid) {
      await usbPrinter.close();
      this.isConnected = false;
      this.printer.connected = false;
      if (timeout != null) {
        await Future.delayed(timeout, () => null);
      }
      return ConnectionResponse.success;
    }
    return ConnectionResponse.timeout;
  }

  @override
  writeBytes(List<int> data, {bool isDisconnect = true}) async {
    if (Platform.isWindows) {
      try {
        if (!isConnected) {
          await connect();
        }
        // Inform the spooler the document is beginning.
        final dwJob = StartDocPrinter(hPrinter, 1, docInfo);
        if (dwJob == 0) {
          ClosePrinter(hPrinter);
          return false;
        }
        // Start a page.
        if (StartPagePrinter(hPrinter) == 0) {
          EndDocPrinter(hPrinter);
          ClosePrinter(hPrinter);
          return false;
        }

        // Send the data to the printer.
        final lpData = data.toUint8();
        dwCount = data.length;
        if (WritePrinter(hPrinter, lpData, dwCount, dwBytesWritten) == 0) {
          EndPagePrinter(hPrinter);
          EndDocPrinter(hPrinter);
          ClosePrinter(hPrinter);
          return false;
        }
        // End the page.
        if (EndPagePrinter(hPrinter) == 0) {
          EndDocPrinter(hPrinter);
          ClosePrinter(hPrinter);
          return false;
        }
        // Inform the spooler that the document is ending.
        if (EndDocPrinter(hPrinter) == 0) {
          ClosePrinter(hPrinter);
          return false;
        }
        if (isDisconnect) {
          // Tidy up the printer handle.
          ClosePrinter(hPrinter);
          // Check to see if correct number of bytes were written.
          if (dwBytesWritten.value != dwCount) return false;
          return true;
        }
      } catch (e) {
        PosPrinterManager.logger.error("Error : $e");
      }

      free(phPrinter);
      free(pDocName);
      free(pDataType);
      free(docInfo);
      free(dwBytesWritten);
    } else if (Platform.isAndroid) {
      PosPrinterManager.logger("start write");
      var bytes = Uint8List.fromList(data);
      int max = 16384;

      /// maxChunk limit on android
      var datas = bytes.chunkBy(max);
      await Future.forEach(datas, (data) async => await usbPrinter.write(data));
      PosPrinterManager.logger("end write bytes.length${bytes.length}");
      if (isDisconnect) {
        try {
          await usbPrinter.close();
          this.isConnected = false;
          this.printer.connected = false;
        } catch (e) {
          PosPrinterManager.logger.error("Error : $e");
        }
      }
    }
  }
}

/// extension for converting list<int> to Unit8 to work with win32
extension on List<int> {
  Pointer<Uint8> toUint8() {
    final result = calloc<Uint8>(this.length);
    final nativeString = result.asTypedList(this.length);
    nativeString.setAll(0, this);
    return result;
  }

  List<List<int>> chunkBy(num value) {
    List<List<int>> result = [];
    final size = this.length;
    int max = size ~/ value;
    int check = size % value;
    if (check > 0) {
      max += 1;
    }
    if (size <= value) {
      result = [this];
    } else {
      for (var i = 0; i < max; i++) {
        int startIndex = value * i;
        int endIndex = value * (i + 1);
        if (endIndex > size) {
          endIndex = size;
        }
        var sub = this.sublist(startIndex, endIndex);
        print("startIndex=$startIndex || endIndex=$endIndex");
        result.add(sub);
      }
    }
    return result;
  }
}
