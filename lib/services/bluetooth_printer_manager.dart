import 'dart:typed_data';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils.dart';
import 'package:pos_printer_manager/enums/connection_response.dart';
import 'package:pos_printer_manager/models/bluetooth_printer.dart';
import 'package:pos_printer_manager/models/pos_printer.dart';
import 'printer_manager.dart';

/// Bluetooth Printer
class BluetoothPrinterManager extends PrinterManager {
  Generator generator;
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  BluetoothPrinterManager(
    POSPrinter printer,
    PaperSize paperSize,
    CapabilityProfile profile, {
    int spaceBetweenRows = 5,
    int port: 9100,
  }) {
    assert(printer != null);
    super.printer = printer;
    super.address = printer.address;
    super.paperSize = paperSize;
    super.profile = profile;
    super.spaceBetweenRows = spaceBetweenRows;
    super.port = port;
    generator =
        Generator(paperSize, profile, spaceBetweenRows: spaceBetweenRows);
  }

  /// [connect] let you connect to a bluetooth printer
  Future<ConnectionResponse> connect(
      {Duration timeout: const Duration(seconds: 5)}) async {
    try {
      var _device = BluetoothDevice(printer.name, printer.address);
      await bluetooth.connect(_device);
      this.isConnected = true;
      this.printer.connected = true;
      return Future<ConnectionResponse>.value(ConnectionResponse.success);
    } catch (e) {
      this.isConnected = false;
      this.printer.connected = false;
      return Future<ConnectionResponse>.value(ConnectionResponse.timeout);
    }
  }

  /// [discover] let you explore all bluetooth printer nearby your device
  static Future<List<BluetoothPrinter>> discover() async {
    var results = await BlueThermalPrinter.instance.getBondedDevices();
    return [
      ...results
          .map((e) => BluetoothPrinter(
                id: e.address,
                name: e.name,
                address: e.address,
                type: e.type,
              ))
          .toList()
    ];
  }

  /// [writeBytes] let you write raw list int data into socket
  writeBytes(List<int> data) async {
    try {
      if (!isConnected) {
        await connect();
      }
      bluetooth.writeBytes(Uint8List.fromList(data));
      await disconnect();
    } catch (e) {
      print("Error : $e");
    }
  }

  /// [timeout]: milliseconds to wait after closing the socket
  Future<ConnectionResponse> disconnect({Duration timeout}) async {
    await bluetooth?.disconnect();
    this.isConnected = false;
    if (timeout != null) {
      await Future.delayed(timeout, () => null);
    }
    return ConnectionResponse.success;
  }
}
