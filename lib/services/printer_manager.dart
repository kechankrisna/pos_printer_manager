import 'package:esc_pos_utils_plus/esc_pos_utils.dart';
import 'package:pos_printer_manager/enums/connection_response.dart';
import 'package:pos_printer_manager/models/pos_printer.dart';

abstract class PrinterManager {
  PaperSize paperSize;
  CapabilityProfile profile;
  Generator generator;
  bool isConnected = false;
  String address;
  int vendorId;
  int productId;
  int deviceId;
  int port = 9100;
  int spaceBetweenRows = 5;
  POSPrinter printer;

  Future<ConnectionResponse> connect({Duration timeout});

  writeBytes(List<int> data, {bool isDisconnect: true});

  Future<ConnectionResponse> disconnect({Duration timeout});

  // ************************ Printer Commands ************************
  // void reset() {
  //   socket.add(generator.reset());
  // }

  // void text(
  //   String text, {
  //   PosStyles styles = const PosStyles(),
  //   int linesAfter = 0,
  //   bool containsChinese = false,
  //   int maxCharsPerLine,
  // }) {
  //   socket.add(generator.text(text,
  //       styles: styles,
  //       linesAfter: linesAfter,
  //       containsChinese: containsChinese,
  //       maxCharsPerLine: maxCharsPerLine));
  // }

  // void setGlobalCodeTable(String codeTable) {
  //   socket.add(generator.setGlobalCodeTable(codeTable));
  // }

  // void setGlobalFont(PosFontType font, {int maxCharsPerLine}) {
  //   socket.add(generator.setGlobalFont(font, maxCharsPerLine: maxCharsPerLine));
  // }

  // void setStyles(PosStyles styles, {bool isKanji = false}) {
  //   socket.add(generator.setStyles(styles, isKanji: isKanji));
  // }

  // void rawBytes(List<int> cmd, {bool isKanji = false}) {
  //   socket.add(generator.rawBytes(cmd, isKanji: isKanji));
  // }

  // void emptyLines(int n) {
  //   socket.add(generator.emptyLines(n));
  // }

  // void feed(int n) {
  //   socket.add(generator.feed(n));
  // }

  // void cut({PosCutMode mode = PosCutMode.full}) {
  //   socket.add(generator.cut(mode: mode));
  // }

  // void printCodeTable({String codeTable}) {
  //   socket.add(generator.printCodeTable(codeTable: codeTable));
  // }

  // void beep({int n = 3, PosBeepDuration duration = PosBeepDuration.beep450ms}) {
  //   socket.add(generator.beep(n: n, duration: duration));
  // }

  // void reverseFeed(int n) {
  //   socket.add(generator.reverseFeed(n));
  // }

  // void row(List<PosColumn> cols) {
  //   socket.add(generator.row(cols));
  // }

  // void image(Image imgSrc, {PosAlign align = PosAlign.center}) {
  //   socket.add(generator.image(imgSrc, align: align));
  // }

  // void imageRaster(
  //   Image image, {
  //   PosAlign align = PosAlign.center,
  //   bool highDensityHorizontal = true,
  //   bool highDensityVertical = true,
  //   PosImageFn imageFn = PosImageFn.bitImageRaster,
  // }) {
  //   socket.add(generator.imageRaster(
  //     image,
  //     align: align,
  //     highDensityHorizontal: highDensityHorizontal,
  //     highDensityVertical: highDensityVertical,
  //     imageFn: imageFn,
  //   ));
  // }

  // void barcode(
  //   Barcode barcode, {
  //   int width,
  //   int height,
  //   BarcodeFont font,
  //   BarcodeText textPos = BarcodeText.below,
  //   PosAlign align = PosAlign.center,
  // }) {
  //   socket.add(generator.barcode(
  //     barcode,
  //     width: width,
  //     height: height,
  //     font: font,
  //     textPos: textPos,
  //     align: align,
  //   ));
  // }

  // void qrcode(
  //   String text, {
  //   PosAlign align = PosAlign.center,
  //   QRSize size = QRSize.Size4,
  //   QRCorrection cor = QRCorrection.L,
  // }) {
  //   socket.add(generator.qrcode(text, align: align, size: size, cor: cor));
  // }

  // void drawer({PosDrawer pin = PosDrawer.pin2}) {
  //   socket.add(generator.drawer(pin: pin));
  // }

  // void hr({String ch = '-', int len, int linesAfter = 0}) {
  //   socket.add(generator.hr(ch: ch, linesAfter: linesAfter));
  // }

  // void textEncoded(
  //   Uint8List textBytes, {
  //   PosStyles styles = const PosStyles(),
  //   int linesAfter = 0,
  //   int maxCharsPerLine,
  // }) {
  //   socket.add(generator.textEncoded(
  //     textBytes,
  //     styles: styles,
  //     linesAfter: linesAfter,
  //     maxCharsPerLine: maxCharsPerLine,
  //   ));
  // }
  // // ************************ (end) Printer Commands ************************
}
