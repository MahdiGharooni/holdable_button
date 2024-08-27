import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holdable_button/holdable_button.dart';
import 'package:holdable_button/holdable_button_platform_interface.dart';
import 'package:holdable_button/utils/utils.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHoldableButtonPlatform
    with MockPlatformInterfaceMixin
    implements HoldableButtonPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  testWidgets('confirmAfterDuration', (WidgetTester tester) async {
    bool confirmed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HoldableButton(
            loadingType: LoadingType.edgeLoading,
            width: 200,
            height: 100,
            buttonColor: Colors.blue,
            loadingColor: Colors.red,
            duration: 4,
            radius: 16,
            strokeWidth: 8,
            onConfirm: () {
              confirmed = true;
            },
            child: const Text('Hold Me'),
          ),
        ),
      ),
    );

    expect(confirmed, false);

    await tester.timedDrag(find.byType(HoldableButton), const Offset(0, 0),
        const Duration(seconds: 5));
    await tester.pumpAndSettle();

    expect(confirmed, true);
  });

  testWidgets('notConfirmBeforeDuration', (WidgetTester tester) async {
    bool confirmed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HoldableButton(
            loadingType: LoadingType.edgeLoading,
            width: 200,
            height: 100,
            buttonColor: Colors.blue,
            loadingColor: Colors.red,
            duration: 4,
            radius: 16,
            strokeWidth: 8,
            onConfirm: () {
              confirmed = true;
            },
            child: const Text('Hold Me'),
          ),
        ),
      ),
    );

    expect(confirmed, false);

    await tester.timedDrag(find.byType(HoldableButton), const Offset(0, 0),
        const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(confirmed, false);
  });
}
