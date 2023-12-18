import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holdable_button/holdable_button_method_channel.dart';

void main() {
  MethodChannelHoldableButton platform = MethodChannelHoldableButton();
  const MethodChannel channel = MethodChannel('holdable_button');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
