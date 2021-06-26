// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.
import 'package:easy_logger/easy_logger.dart';
export 'models/network_printer.dart';
export 'models/bluetooth_printer.dart';
export 'models/usb_printer.dart';
export 'services/bluetooth_printer_manager.dart';
export 'services/network_printer_manager.dart';
export 'services/usb_printer_manager.dart';
export 'enums/bluetooth_printer_type.dart';
export 'enums/connection_response.dart';
export 'enums/connection_type.dart';
export 'package:esc_pos_utils_plus/esc_pos_utils.dart';

class PosPrinterManager {
  static EasyLogger logger = EasyLogger(
    name: 'pos_printer_manager',
    defaultLevel: LevelMessages.debug,
    enableBuildModes: [BuildMode.debug, BuildMode.profile, BuildMode.release],
    enableLevels: [
      LevelMessages.debug,
      LevelMessages.info,
      LevelMessages.error,
      LevelMessages.warning
    ],
  );
}
