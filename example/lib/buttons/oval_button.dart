import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

class OvalButton extends StatelessWidget {
  const OvalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return HoldableButton(
      width: 200,
      height: 100,
      buttonColor: Colors.orange,
      loadingColor: Colors.brown,
      duration: 3,
      radius: 100,
      strokeWidth: 20,
      startPoint: 0,
      onConfirm: () {
        debugPrint("OnConfirm");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.add, size: 32),
          SizedBox(width: 12),
          Text(
            'Oval',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
