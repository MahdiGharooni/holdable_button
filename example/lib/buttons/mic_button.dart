import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

class MicButton extends StatefulWidget {
  const MicButton({super.key});

  @override
  State<MicButton> createState() => _MicButtonState();
}

class _MicButtonState extends State<MicButton> {
  IconData _iconData = Icons.mic;

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
