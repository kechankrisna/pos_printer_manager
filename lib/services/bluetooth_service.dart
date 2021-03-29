import 'package:blue_thermal_printer/blue_thermal_printer.dart';

class BluetoothService {

  Future<List<BluetoothDevice>> findBluetoothDevice() async {
    BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
    var devices = await bluetooth.getBondedDevices();
    return devices;
  }
}
