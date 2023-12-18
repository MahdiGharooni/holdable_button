#import "HoldableButtonPlugin.h"
#if __has_include(<holdable_button/holdable_button-Swift.h>)
#import <holdable_button/holdable_button-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "holdable_button-Swift.h"
#endif

@implementation HoldableButtonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHoldableButtonPlugin registerWithRegistrar:registrar];
}
@end
