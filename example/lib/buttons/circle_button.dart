import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return HoldableButton(
      width: 200,
      height: 200,
      buttonColor: Colors.red,
      loadingColor: Colors.blue,
      duration: 4,
      radius: 100,
      strokeWidth: 20,
      startPoint: 0.25,
      hasVibrate: true,
      onConfirm: () {
        debugPrint("OnConfirm");
      },
      child: const Text(
        'Circle',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
