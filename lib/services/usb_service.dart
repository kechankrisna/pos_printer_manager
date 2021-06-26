import 'dart:io';
import 'package:flutter_usb_printer/flutter_usb_printer.dart';
import 'package:pos_printer_manager/models/usb_printer.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';
import 'package:printing/printing.dart';

class USBService {
  static Future<List<USBPrinter>> findUSBPrinter() async {
    List<USBPrinter> devices = [];
    if (Platform.isWindows) {
      var results = await Printing.listPrinters();
      devices = [
        ...results
            .where((entry) => entry.isAvailable)
            .toList()
            .map((e) => USBPrinter(
                  name: e.name,
                  address: e.url,
                ))
            .toList()
      ];
    } else if (Platform.isAndroid) {
      var results = await FlutterUsbPrinter.getUSBDeviceList();

      devices = [
        ...results
            .map((e) => USBPrinter(
                  name: e["productName"],
                  address: e["manufacturer"],
                  vendorId: int.tryParse(e["vendorId"]),
                  productId: int.tryParse(e["productId"]),
                  deviceId: int.tryParse(e["deviceId"]),
                ))
            .toList()
      ];
    } else {
      /// no support
    }

    return devices;
  }
}
