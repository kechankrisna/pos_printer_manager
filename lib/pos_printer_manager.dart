import 'package:easy_logger/easy_logger.dart';

export 'package:pos_printer_manager/models/network_printer.dart';
export 'package:pos_printer_manager/models/bluetooth_printer.dart';
export 'package:pos_printer_manager/models/usb_printer.dart';
export 'package:pos_printer_manager/services/bluetooth_printer_manager.dart';
export 'package:pos_printer_manager/services/network_printer_manager.dart';
export 'package:pos_printer_manager/services/usb_printer_manager.dart';
export 'package:pos_printer_manager/enums/bluetooth_printer_type.dart';
export 'package:pos_printer_manager/enums/connection_response.dart';
export 'package:pos_printer_manager/enums/connection_type.dart';
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
