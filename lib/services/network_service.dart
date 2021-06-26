import 'package:network_info_plus/network_info_plus.dart';
import 'package:pos_printer_manager/helpers/network_analyzer.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';

class NetworkService {}

Future<List<String>> findNetworkPrinter({int port: 9100}) async {
  final String ip = await (NetworkInfo().getWifiIP());
  PosPrinterManager.logger.info("ip: $ip");
  final String subnet = ip.substring(0, ip.lastIndexOf('.'));
  PosPrinterManager.logger.info("subnet: $subnet");

  final stream = NetworkAnalyzer.discover2(subnet, port);
  var results = await stream.toList();
  return [
    ...results.where((entry) => entry.exists).toList().map((e) => e.ip).toList()
  ];
}
