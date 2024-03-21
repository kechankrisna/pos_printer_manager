import 'dart:typed_data';
import 'package:esc_pos_utils_plus/esc_pos_utils.dart';
import 'package:image/image.dart' as img;

class ESCPrinterService {
  final Uint8List? receipt;
  List<int>? _bytes;
  List<int>? get bytes => _bytes;
  PaperSize? _paperSize;
  CapabilityProfile? _profile;

  ESCPrinterService(this.receipt);

  Future<List<int>> getBytes({
    PaperSize paperSize: PaperSize.mm80,
    CapabilityProfile? profile,
    String name = "default",
  }) async {
    List<int> bytes = [];
    _profile = profile ?? (await CapabilityProfile.load(name: name));
    print(_profile!.name);
    _paperSize = paperSize;
    assert(receipt != null);
    assert(_paperSize != null);
    assert(_profile != null);
    Generator generator = Generator(_paperSize!, _profile!);
    final img.Image _resize =
        img.copyResize(img.decodeImage(receipt!)!, width: _paperSize!.width);
    bytes += generator.imageRaster(_resize);
    bytes += generator.feed(2);
    bytes += generator.cut();
    return bytes;
  }
}
