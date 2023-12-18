import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'holdable_button_method_channel.dart';

abstract class HoldableButtonPlatform extends PlatformInterface {
  /// Constructs a HoldableButtonPlatform.
  HoldableButtonPlatform() : super(token: _token);

  static final Object _token = Object();

  static HoldableButtonPlatform _instance = MethodChannelHoldableButton();

  /// The default instance of [HoldableButtonPlatform] to use.
  ///
  /// Defaults to [MethodChannelHoldableButton].
  static HoldableButtonPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HoldableButtonPlatform] when
  /// they register themselves.
  static set instance(HoldableButtonPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
