import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';
import 'package:holdable_button/utils/utils.dart';

class SquareButton extends StatefulWidget {
  const SquareButton({super.key});

  @override
  State<SquareButton> createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  Widget child = const Text(
    'Square',
    style: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return HoldableButton(
      loadingType: LoadingType.edgeLoading,
      width: 200,
      height: 200,
      buttonColor: Colors.green,
      loadingColor: Colors.black87,
      duration: 3,
      radius: 1,
      strokeWidth: 20,
      edgeLoadingStartPoint: 0.5,
      padding: const EdgeInsets.all(2),
      onConfirm: () {
        setState(() {
          child = const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        });
      },
      child: child,
    );
  }
}
