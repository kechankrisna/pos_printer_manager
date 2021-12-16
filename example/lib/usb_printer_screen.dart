import 'package:flutter/material.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';
import 'package:pos_printer_manager_example/webview_helper.dart';
import 'package:webcontent_converter/webcontent_converter.dart';
import 'demo.dart';
import 'service.dart';

class USBPrinterScreen extends StatefulWidget {
  @override
  _USBPrinterScreenState createState() => _USBPrinterScreenState();
}

class _USBPrinterScreenState extends State<USBPrinterScreen> {
  bool _isLoading = false;
  List<USBPrinter> _printers = [];
  USBPrinterManager? _manager;
  List<int> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USB Printer Screen"),
      ),
      body: ListView(
        children: [
          ..._printers
              .map((printer) => ListTile(
                    title: Text("${printer.name}"),
                    subtitle: Text("${printer.address}"),
                    leading: Icon(Icons.usb),
                    onTap: () => _connect(printer),
                    onLongPress: () {
                      _startPrinter();
                    },
                    selected: printer.connected,
                  ))
              .toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: _isLoading ? Icon(Icons.stop) : Icon(Icons.play_arrow),
        onPressed: _isLoading ? null : _scan,
      ),
    );
  }

  _scan() async {
    setState(() {
      _isLoading = true;
      _printers = [];
    });
    var printers = await USBPrinterManager.discover();
    setState(() {
      _isLoading = false;
      _printers = printers;
    });
  }

  _connect(USBPrinter printer) async {
    var paperSize = PaperSize.mm80;
    var profile = await CapabilityProfile.load();
    var manager = USBPrinterManager(printer, paperSize, profile);
    await manager.connect();
    setState(() {
      _manager = manager;
      printer.connected = true;
    });
  }

  _startPrinter() async {
    if (_data.isEmpty) {
      final content = Demo.getShortReceiptContent();
      var bytes = await WebcontentConverter.contentToImage(
        content: content,
        executablePath: WebViewHelper.executablePath(),
      );
      var service = ESCPrinterService(bytes);
      var data = await service.getBytes();
      if (mounted) setState(() => _data = data);
    }

    if (_manager != null) {
      print("isConnected ${_manager!.isConnected}");
      _manager!.writeBytes(_data, isDisconnect: false);
    }
  }
}
