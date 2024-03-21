import 'dart:ffi';
import 'package:ffi/ffi.dart';

/// extension for converting list<int> to Unit8 to work with win32
extension IntParsing on List<int> {
  Pointer<Uint8> toUint8() {
    final result = calloc<Uint8>(this.length);
    final nativeString = result.asTypedList(this.length);
    nativeString.setAll(0, this);
    return result;
  }

  List<List<int>> chunkBy(num value, {bool isDebug = false}) {
    List<List<int>> result = [];
    final size = this.length;
    int max = size ~/ value;
    int check = size % (value as int);
    if (check > 0) {
      max += 1;
    }
    if (size <= value) {
      result = [this];
    } else {
      for (var i = 0; i < max; i++) {
        int startIndex = value * i;
        int endIndex = value * (i + 1);
        if (endIndex > size) {
          endIndex = size;
        }
        var sub = this.sublist(startIndex, endIndex);
        if (isDebug) {
          print("startIndex=$startIndex || endIndex=$endIndex");
        }
        result.add(sub);
      }
    }
    return result;
  }
}
