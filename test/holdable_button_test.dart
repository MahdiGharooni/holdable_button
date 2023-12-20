import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holdable_button/holdable_button.dart';
import 'package:holdable_button/holdable_button_platform_interface.dart';
import 'package:holdable_button/holdable_button_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHoldableButtonPlatform
    with MockPlatformInterfaceMixin
    implements HoldableButtonPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HoldableButtonPlatform initialPlatform =
      HoldableButtonPlatform.instance;

  test('$MethodChannelHoldableButton is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHoldableButton>());
  });

  test('getPlatformVersion', () async {
    HoldableButton holdableButtonPlugin = HoldableButton(
      width: 200,
      height: 100,
      buttonColor: Colors.blue,
      loadingColor: Colors.red,
      duration: 4,
      radius: 16,
      strokeWidth: 8,
      onConfirm: () {
        debugPrint("OnConfirm");
      },
      child: const Text('Hold Me'),
    );
    MockHoldableButtonPlatform fakePlatform = MockHoldableButtonPlatform();
    HoldableButtonPlatform.instance = fakePlatform;

    // expect(await holdableButtonPlugin.getPlatformVersion(), '42');
  });
}
