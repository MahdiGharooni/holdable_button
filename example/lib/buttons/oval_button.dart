import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';
import 'package:holdable_button/utils/utils.dart';

class OvalButton extends StatelessWidget {
  const OvalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return HoldableButton(
      loadingType: LoadingType.edgeLoading,
      width: 200,
      height: 100,
      buttonColor: Colors.orange,
      loadingColor: Colors.brown,
      duration: 3,
      radius: 100,
      strokeWidth: 20,
      edgeLoadingStartPoint: 0,
      hasVibrate: true,
      onConfirm: () {
        debugPrint("OnConfirm");
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
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
