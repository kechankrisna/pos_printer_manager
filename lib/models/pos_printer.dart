import 'package:pos_printer_manager/enums/bluetooth_printer_type.dart';
import 'package:pos_printer_manager/enums/connection_type.dart';

class POSPrinter {
  String? id;
  String? name;
  String? address;
  int? deviceId;
  int? vendorId;
  int? productId;
  bool connected;
  int type;
  BluetoothPrinterType get bluetoothType => type.printerType();
  ConnectionType? connectionType;

  factory POSPrinter.instance() => POSPrinter();

  POSPrinter({
    this.id,
    this.name,
    this.address,
    this.deviceId,
    this.vendorId,
    this.productId,
    this.connected: false,
    this.type: 0,
    this.connectionType,
  });
}

extension on int {
  BluetoothPrinterType printerType() {
    BluetoothPrinterType value;
    switch (this) {
      case 1:
        value = BluetoothPrinterType.classic;
        break;
      case 2:
        value = BluetoothPrinterType.le;
        break;
      case 3:
        value = BluetoothPrinterType.dual;
        break;
      default:
        value = BluetoothPrinterType.unknown;
    }
    return value;
  }
}
