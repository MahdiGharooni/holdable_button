import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

class RectangleButton extends StatefulWidget {
  const RectangleButton({super.key});

  @override
  State<RectangleButton> createState() => _RectangleButtonState();
}

class _RectangleButtonState extends State<RectangleButton> {
  String _text = "Hold Me 4 Seconds";

  Color  buttonColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return HoldableButton(
      width: 300,
      height: 200,
      buttonColor:buttonColor,
      loadingColor: Colors.red,
      duration: 4,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      radius: 16,
      strokeWidth: 8,
      onConfirm: () {
        setState(() {
          _text = "CONFIRMED";
          buttonColor = Colors.green;
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
