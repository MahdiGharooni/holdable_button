import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

class LongButton extends StatefulWidget {
  const LongButton({super.key});

  @override
  State<LongButton> createState() => _LongButtonState();
}

class _LongButtonState extends State<LongButton> {
  Color _bgColor = Colors.blueGrey[400]!;
  String _text = "With Margin";

  @override
  Widget build(BuildContext context) {
    return HoldableButton(
      width: 300,
      height: 80,
      buttonColor: _bgColor,
      loadingColor: Colors.lightGreen,
      duration: 3,
      radius: 4,
      strokeWidth: 4,
      margin: const EdgeInsets.all(4),
      startPoint: 0.3,
      resetAfterFinish: false,
      onConfirm: () {
        setState(() {
          _text = "Done";
          _bgColor = Colors.green[700]!;
        });
      },
      child: Text(
        _text,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
