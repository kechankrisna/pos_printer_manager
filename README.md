# pos_printer_manager

This plugin allow developer to print to esc printer both wireless or bluetooth (currently support only on android). This has method to list down those printers easily.

## Example

- Bluetooth Printer

```
  _scan() async {
    print("scan");
    setState(() {
      _isLoading = true;
      _printers = [];
    });
    var printers = await BluetoothPrinterManager.discover();
    print(printers);
    setState(() {
      _isLoading = false;
      _printers = printers;
    });
  }

  _connect(BluetoothPrinter printer) async {
    var paperSize = PaperSize.mm80;
    var profile = await CapabilityProfile.load();
    var manager = BluetoothPrinterManager(printer, paperSize, profile);
    await manager.connect();
    print(" -==== connected =====- ");
    setState(() {
      _manager = manager;
      printer.connected = true;
    });
  }

  _startPrinter() async {
    final content = Demo.getShortReceiptContent();
    var bytes = await WebcontentConverter.contentToImage(content: content);
    var service = ESCPrinterService(bytes);
    var data = await service.getBytes(paperSize: PaperSize.mm58);
    if (_manager != null) {
      print("isConnected ${_manager.isConnected}");
      _manager.writeBytes(data, isDisconnect: false);
    }
  }
```

- Network Printer

```
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
      print("isConnected ${_manager.isConnected}");
      _manager.writeBytes(_data, isDisconnect: false);
    }
  }
```

- USB Printer
```
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
      print("isConnected ${_manager.isConnected}");
      _manager.writeBytes(_data, isDisconnect: false);
    }
  }
```

## Supports

| Device | Network | Bluetooth | USB |
| --- | --- | --- | --- |
| Android | &check; | &check; | &check; |
| IOS | &check; | &check; | &cross; |
| Macos | &check; | &cross; | &cross; |
| Windows | &check; | &cross; | &check; |
| Linux | &check; | &cross; | &cross; |

*** USB: will be the set to the next plan of update

## Getting Started
```
  flutter pub add pos_printer_manager
```




Thank to :
- [blue_thermal_printer](https://pub.dev/packages/blue_thermal_printer)
- [esc_pos_utils](https://pub.dev/packages/esc_pos_utils)
- [ping_discover_network](https://pub.dev/packages/ping_discover_network)
- [network_info_plus](https://pub.dev/packages/network_info_plus)
- [printing](https://pub.dev/packages/printing)