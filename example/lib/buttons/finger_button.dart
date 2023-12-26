import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

class FingerButton extends StatefulWidget {
  const FingerButton({super.key});

  @override
  State<FingerButton> createState() => _FingerButtonState();
}

class _FingerButtonState extends State<FingerButton> {
  IconData _iconData = Icons.fingerprint;

  Color _bgColor = Colors.blueGrey[900]!;

  @override
  Widget build(BuildContext context) {
    return HoldableButton(
      width: 50,
      height: 50,
      buttonColor: _bgColor,
      loadingColor: Colors.deepPurpleAccent,
      duration: 3,
      radius: 100,
      strokeWidth: 4,
      margin: const EdgeInsets.all(4),
      startPoint: 0.25,
      resetAfterFinish: true,
      onConfirm: () {
        setState(() {
          _iconData = Icons.done;
          _bgColor = Colors.green[700]!;
        });
      },
      child: Icon(
        _iconData,
        color: Colors.white,
      ),
    );
  }
}
