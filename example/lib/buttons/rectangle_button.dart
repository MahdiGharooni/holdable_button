import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

class RectangleButton extends StatefulWidget {
  const RectangleButton({super.key});

  @override
  State<RectangleButton> createState() => _RectangleButtonState();
}

class _RectangleButtonState extends State<RectangleButton> {
  String _text = "Hold Me";

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
        setState(() {
          _text = "CONFIRMED";
        });
      },
      child: Text(
        _text,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
