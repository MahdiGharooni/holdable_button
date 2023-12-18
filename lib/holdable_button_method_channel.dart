import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'holdable_button_platform_interface.dart';

/// An implementation of [HoldableButtonPlatform] that uses method channels.
class MethodChannelHoldableButton extends HoldableButtonPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('holdable_button');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
