import 'dart:io';
import 'package:flutter_blue/flutter_blue.dart' as fblue;
import 'package:blue_thermal_printer/blue_thermal_printer.dart' as thermal;
import '../pos_printer_manager.dart';

class BluetoothService {
  static Future<List<BluetoothPrinter>> findBluetoothDevice() async {
    List<BluetoothPrinter> devices = [];
    if (Platform.isAndroid) {
      thermal.BlueThermalPrinter bluetooth =
          thermal.BlueThermalPrinter.instance;

      var results = await bluetooth.getBondedDevices();
      devices = results
          .map(
            (d) => BluetoothPrinter(
              id: d.address,
              address: d.address,
              name: d.name,
              type: d.type,
            ),
          )
          .toList();
    } else if (Platform.isIOS) {
      fblue.FlutterBlue flutterBlue = fblue.FlutterBlue.instance;
      var results = <fblue.BluetoothDevice>[];
      await flutterBlue.startScan(timeout: Duration(seconds: 10));

      flutterBlue.scanResults.listen((stream) {
        for (fblue.ScanResult result in stream) {
          results.add(result.device);
        }
      });
      await flutterBlue.stopScan();
      devices = results
          .toSet()
          .toList()
          .map(
            (d) => BluetoothPrinter(
              id: d.id.id,
              address: d.id.id,
              name: d.name,
              type: d.type.index,
            ),
          )
          .toList();
    }
    return devices;
  }
}
