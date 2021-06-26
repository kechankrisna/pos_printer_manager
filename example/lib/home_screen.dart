import 'package:flutter/material.dart';
import 'network_printer_screen.dart';
import 'bluetooth_printer_screen.dart';
import 'usb_printer_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POS PRINTER MANAGER"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Network Printer (android, ios, desktop)"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => NetWorkPrinterScreen()));
            },
          ),
          ListTile(
            title: Text("Bluetooth Printer (android, ios:ble)"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => BluetoothPrinterScreen()));
            },
          ),
          ListTile(
            title: Text("USB Printer (desktop:windows, android)"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => USBPrinterScreen()));
            },
          ),
        ],
      ),
    );
  }
}
