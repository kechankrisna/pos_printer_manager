# pos_printer_manager

This plugin allow developer to print to esc printer both wireless or bluetooth (currently support only on android). This has method to list down those printers easily.

## Example

- Bluetooth Printer

```
_scan() async {
    setState(() {
      _isLoading = true;
      _printers = [];
    });
    var printers = await BluetoothPrinterManager.discover();
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
    final content = Demo.getReceiptContent();
    var bytes = await WebcontentConverter.contentToImage(content: content);
    var service = ESCPrinterService(bytes);
    var data = await service.getBytes(paperSize: PaperSize.mm58);
    if (_manager != null) {
      _manager.writeBytes(data);
    }
  }
```

- Wireless Printer

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
    final content = Demo.getReceiptContent();
    var bytes = await WebcontentConverter.contentToImage(content: content);
    var service = ESCPrinterService(bytes);
    var data = await service.getBytes();
    if (_manager != null) {
      _manager.writeBytes(data);
    }
  }
```


## Supports

| Device | Wireless | Bluetooth | USB |
| --- | --- | --- | --- |
| Android | &check; | &check; | &cross; |
| IOS | &check; | &check; | &cross; |
| Macos | &check; | &cross; | &cross; |
| Desktop | &check; | &cross; | &cross; |
| Linux | &check; | &cross; | &cross; |

*** USB: will be the set to the next plan of update

## Getting Started


This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

The plugin project was generated without specifying the `--platforms` flag, no platforms are currently supported.
To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.


Thank to :
- [blue_thermal_printer](https://pub.dev/packages/blue_thermal_printer)
- [esc_pos_utils](https://pub.dev/packages/esc_pos_utils)
- [ping_discover_network](https://pub.dev/packages/ping_discover_network)
- [wifi](https://pub.dev/packages/wifi)