import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return HoldableButton(
      width: 300,
      height: 200,
      buttonColor: Colors.blue,
      loadingColor: Colors.red,
      duration: 4,
      radius: 16,
      strokeWidth: 20,
      onConfirm: () {
        debugPrint("OnConfirm");
      },
      child: const Text(
        'Rectangle',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
