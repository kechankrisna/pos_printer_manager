import 'dart:io';
import 'package:pos_printer_manager/models/pos_printer.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';
import 'package:pos_printer_manager/services/extension.dart';
import 'network_service.dart';
import 'printer_manager.dart';

/// Network Printer
class NetworkPrinterManager extends PrinterManager {
  Generator? generator;
  Socket? socket;

  NetworkPrinterManager(
    POSPrinter printer,
    PaperSize paperSize,
    CapabilityProfile profile, {
    int spaceBetweenRows = 5,
    int port = 9100,
  }) {
    super.printer = printer;
    super.address = printer.address;
    super.paperSize = paperSize;
    super.profile = profile;
    super.spaceBetweenRows = spaceBetweenRows;
    super.port = port;
    generator =
        Generator(paperSize, profile, spaceBetweenRows: spaceBetweenRows);
  }

  /// [connect] let you connect to a network printer
  Future<ConnectionResponse> connect(
      {Duration? timeout = const Duration(seconds: 5)}) async {
    try {
      this.socket = await Socket.connect(address, port, timeout: timeout);
      this.isConnected = true;
      this.printer.connected = true;
      return Future<ConnectionResponse>.value(ConnectionResponse.success);
    } catch (e) {
      this.isConnected = false;
      this.printer.connected = false;
      return Future<ConnectionResponse>.value(ConnectionResponse.timeout);
    }
  }

  /// [discover] let you explore all netWork printer in your network
  static Future<List<NetWorkPrinter>> discover() async {
    var results = await findNetworkPrinter();
    return [
      ...results
          .map((e) => NetWorkPrinter(
                id: e,
                name: e,
                address: e,
                type: 0,
              ))
          .toList()
    ];
  }

  /// [writeBytes] let you write raw list int data into socket
  @override
  Future<ConnectionResponse> writeBytes(List<int> data,
      {bool isDisconnect = true}) async {
    try {
      if (!isConnected) {
        await connect();
      }
      print(this.socket);
      final chunked = data.chunkBy(1250);
      final stream = Stream<List<int>>.fromIterable(chunked);
      // add chunked stream
      await socket!.addStream(stream);

      /// this.socket?.add(data);
      if (isDisconnect) {
        await disconnect();
      }
      return ConnectionResponse.success;
    } catch (e) {
      PosPrinterManager.logger.error("Error : $e");
      return ConnectionResponse.printerNotConnected;
    }
  }

  /// [timeout]: milliseconds to wait after closing the socket
  Future<ConnectionResponse> disconnect({Duration? timeout}) async {
    await socket?.flush();
    socket?.destroy();
    await socket?.close();
    this.isConnected = false;
    if (timeout != null) {
      await Future.delayed(timeout, () => null);
    }
    return ConnectionResponse.success;
  }
}
