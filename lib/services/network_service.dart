import 'package:pos_printer_manager/helpers/network_analyzer.dart';
import 'package:wifi/wifi.dart';

class NetworkService {
  
}

Future<List<String>> findNetworkPrinter({int port: 9100}) async {
  final String ip = await Wifi.ip;
  final String subnet = ip.substring(0, ip.lastIndexOf('.'));

  final stream = NetworkAnalyzer.discover2(subnet, port);
  var results = await stream.toList();
  return [
    ...results.where((entry) => entry.exists).toList().map((e) => e.ip).toList()
  ];
}
