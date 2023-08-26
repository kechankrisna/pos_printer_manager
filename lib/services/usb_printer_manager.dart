import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:flutter_usb_printer/flutter_usb_printer.dart';
import 'package:win32/win32.dart';
import 'package:pos_printer_manager/models/pos_printer.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';
import 'package:pos_printer_manager/services/printer_manager.dart';
import 'extension.dart';
import 'usb_service.dart';

/// USB Printer
class USBPrinterManager extends PrinterManager {
  Generator? generator;

  /// usb_serial
  var usbPrinter = FlutterUsbPrinter();

  /// [win32]
  Pointer<IntPtr>? phPrinter = calloc<HANDLE>();
  Pointer<Utf16> pDocName = 'My Document'.toNativeUtf16();
  Pointer<Utf16> pDataType = 'RAW'.toNativeUtf16();
  Pointer<Uint32>? dwBytesWritten = calloc<DWORD>();
  Pointer<DOC_INFO_1>? docInfo;
  late Pointer<Utf16> szPrinterName;
  late int hPrinter;
  int? dwCount;

  USBPrinterManager(
    POSPrinter printer,
    PaperSize paperSize,
    CapabilityProfile profile, {
    int spaceBetweenRows = 5,
    int port = 9100,
  }) {
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
      {Duration? timeout = const Duration(seconds: 5)}) async {
    if (Platform.isWindows) {
      try {
        docInfo = calloc<DOC_INFO_1>()
          ..ref.pDocName = pDocName
          ..ref.pOutputFile = nullptr
          ..ref.pDatatype = pDataType;
        szPrinterName = printer.name!.toNativeUtf16();

        final phPrinter = calloc<HANDLE>();
        if (OpenPrinter(szPrinterName, phPrinter, nullptr) == FALSE) {
          PosPrinterManager.logger.error("can not open");
          this.isConnected = false;
          this.printer.connected = false;
          return Future<ConnectionResponse>.value(
              ConnectionResponse.printerNotConnected);
        } else {
          PosPrinterManager.logger.info("szPrinterName: $szPrinterName");
          this.hPrinter = phPrinter.value;
          this.isConnected = true;
          this.printer.connected = true;
          return Future<ConnectionResponse>.value(ConnectionResponse.success);
        }
      } catch (e) {
        this.isConnected = false;
        this.printer.connected = false;
        return Future<ConnectionResponse>.value(ConnectionResponse.timeout);
      }
    } else if (Platform.isAndroid) {
      var usbDevice = await usbPrinter.connect(vendorId!, productId!);
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
  Future<ConnectionResponse> disconnect({Duration? timeout}) async {
    if (Platform.isWindows) {
      // Tidy up the printer handle.
      ClosePrinter(hPrinter);
      free(phPrinter!);
      free(pDocName);
      free(pDataType);
      free(dwBytesWritten!);
      free(docInfo!);
      free(szPrinterName);

      this.isConnected = false;
      this.printer.connected = false;
      if (timeout != null) {
        await Future.delayed(timeout, () => null);
      }
      PosPrinterManager.logger.error("disconnect");
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
  Future<ConnectionResponse> writeBytes(List<int> data,
      {bool isDisconnect = true}) async {
    if (Platform.isWindows) {
      try {
        if (!this.isConnected) {
          await connect();
          PosPrinterManager.logger.info("connect()");
        }

        // Inform the spooler the document is beginning.
        final dwJob = StartDocPrinter(hPrinter, 1, docInfo!);
        if (dwJob == 0) {
          PosPrinterManager.logger.error("dwJob == 0");
          ClosePrinter(hPrinter);
          return ConnectionResponse.printInProgress;
        }
        // Start a page.
        if (StartPagePrinter(hPrinter) == 0) {
          PosPrinterManager.logger.error("StartPagePrinter == 0");
          EndDocPrinter(hPrinter);
          ClosePrinter(hPrinter);
          return ConnectionResponse.printerNotSelected;
        }

        // Send the data to the printer.
        final lpData = data.toUint8();
        dwCount = data.length;
        if (WritePrinter(hPrinter, lpData, dwCount!, dwBytesWritten!) == 0) {
          PosPrinterManager.logger.error("WritePrinter == 0");
          EndPagePrinter(hPrinter);
          EndDocPrinter(hPrinter);
          ClosePrinter(hPrinter);
          return ConnectionResponse.printerNotWritable;
        }

        // End the page.
        if (EndPagePrinter(hPrinter) == 0) {
          PosPrinterManager.logger.error("EndPagePrinter == 0");
          EndDocPrinter(hPrinter);
          ClosePrinter(hPrinter);
        }

        // Inform the spooler that the document is ending.
        if (EndDocPrinter(hPrinter) == 0) {
          PosPrinterManager.logger.error("EndDocPrinter == 0");
          ClosePrinter(hPrinter);
        }

        // Check to see if correct number of bytes were written.
        if (dwBytesWritten!.value != dwCount) {
          PosPrinterManager.logger.error("dwBytesWritten.value != dwCount");
        }

        if (isDisconnect) {
          // Tidy up the printer handle.
          ClosePrinter(hPrinter);
          // await disconnect();
        }
        return ConnectionResponse.success;
      } catch (e) {
        PosPrinterManager.logger.error("Error : $e");
        return ConnectionResponse.unknown;
      }
    } else if (Platform.isAndroid) {
      if (!this.isConnected) {
        await connect();
        PosPrinterManager.logger.info("connect()");
      }

      PosPrinterManager.logger("start write");
      var bytes = Uint8List.fromList(data);
      int max = 16384;

      /// maxChunk limit on android
      var datas = bytes.chunkBy(max);
      await Future.forEach(
          datas, (dynamic data) async => await usbPrinter.write(data));
      PosPrinterManager.logger("end write bytes.length${bytes.length}");

      if (isDisconnect) {
        try {
          await usbPrinter.close();
          this.isConnected = false;
          this.printer.connected = false;
        } catch (e) {
          PosPrinterManager.logger.error("Error : $e");
          return ConnectionResponse.unknown;
        }
      }
      return ConnectionResponse.success;
    } else {
      return ConnectionResponse.unsupport;
    }
  }
}
