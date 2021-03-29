#import "PosPrinterManagerPlugin.h"
#if __has_include(<pos_printer_manager/pos_printer_manager-Swift.h>)
#import <pos_printer_manager/pos_printer_manager-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "pos_printer_manager-Swift.h"
#endif

@implementation PosPrinterManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPosPrinterManagerPlugin registerWithRegistrar:registrar];
}
@end
