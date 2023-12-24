import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

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
      width: 200,
      height: 200,
      buttonColor: Colors.green,
      loadingColor: Colors.black87,
      duration: 3,
      radius: 1,
      strokeWidth: 20,
      startPoint: 0.5,
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
