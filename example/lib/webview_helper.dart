import 'dart:io' as  io;

class WebViewHelper {
  static String? executablePath() {
    var result;
    var paths = [];
    if (io.Platform.isWindows) {
      paths = [
        "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe",
        "C:\\ProgramFiles(x86)\\Google\\Chrome\\Application\\chrome.exe",
        "C:\\Program Files\\Mozilla Firefox\\firefox.exe",
        io.Directory("chromium").absolute.path,
      ];
    } else if (io.Platform.isMacOS) {
      paths = [
        "/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome",
        "/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary",
        "/Applications/Chromium.app/Contents/MacOS/Chromium",
        "/Applications/Firefox.app/Contents/MacOS/firefox",
        "/Applications/Firefox.app/Contents/MacOS/firefox-bin",
        io.Directory("chromium").absolute.path,
      ];
    }
    if (paths.isNotEmpty) {
      for (var path in paths) {
        if (io.File(path).existsSync()) {
          print("====== exist ====== $path");
          result = path;
          return result;
        }
      }
    }

    print("====== not exist ====== ");
    return result;
  }
}
