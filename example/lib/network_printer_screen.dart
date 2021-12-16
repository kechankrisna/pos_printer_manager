import 'package:flutter/material.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';
import 'package:pos_printer_manager_example/webview_helper.dart';
import 'package:webcontent_converter/webcontent_converter.dart';
import 'demo.dart';
import 'service.dart';

class NetWorkPrinterScreen extends StatefulWidget {
  @override
  _NetWorkPrinterScreenState createState() => _NetWorkPrinterScreenState();
}

class _NetWorkPrinterScreenState extends State<NetWorkPrinterScreen> {
  bool _isLoading = false;
  List<NetWorkPrinter> _printers = [];
  NetworkPrinterManager? _manager;
  List<int> _data = [];
  String _name = "default";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network Printer Screen ${printProfiles.length}"),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => printProfiles
                .map(
                  (e) => PopupMenuItem(
                    enabled: e["key"] != _name,
                    child: Text("${e["key"]}"),
                    onTap: () {
                      setState(() {
                        _name = e["key"];
                      });
                    },
                  ),
                )
                .toList(),
          )
        ],
      ),
      body: ListView(
        children: [
          ..._printers
              .map((printer) => ListTile(
                    title: Text("${printer.name}"),
                    subtitle: Text("${printer.address}"),
                    leading: Icon(Icons.cable),
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
    var printers = await NetworkPrinterManager.discover();
    setState(() {
      _isLoading = false;
      _printers = printers;
    });
  }

  _connect(NetWorkPrinter printer) async {
    var paperSize = PaperSize.mm80;
    var profile = await CapabilityProfile.load();
    var manager = NetworkPrinterManager(printer, paperSize, profile);
    await manager.connect();
    setState(() {
      _manager = manager;
      printer.connected = true;
    });
  }

  _startPrinter() async {
    // if (_data.isEmpty) {
    final content = Demo.getShortReceiptContent();
    var bytes = await WebcontentConverter.contentToImage(
      content: content,
      executablePath: WebViewHelper.executablePath(),
    );
    var stopwatch = Stopwatch()..start();
    var service = ESCPrinterService(bytes);
    var data = await service.getBytes(name: _name);

    print("Start print data $_name");

    if (mounted) setState(() => _data = data);

    if (_manager != null) {
      print("isConnected ${_manager!.isConnected}");
      await _manager!.writeBytes(_data, isDisconnect: true);
      WebcontentConverter.logger
          .info("completed executed in ${stopwatch.elapsed}");
    }
  }
}
