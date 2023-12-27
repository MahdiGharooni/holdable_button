import 'package:flutter/material.dart';
import 'package:holdable_button_example/buttons/circle_button.dart';
import 'package:holdable_button_example/buttons/long_button.dart';
import 'package:holdable_button_example/buttons/mic_button.dart';
import 'package:holdable_button_example/buttons/oval_button.dart';
import 'package:holdable_button_example/buttons/square_button.dart';

import 'buttons/rectangle_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Holdable Button Plugin'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Wrap(
              spacing: 32,
              runSpacing: 32,
              children: const [
                RectangleButton(),
                CircleButton(),
                SquareButton(),
                OvalButton(),
                MicButton(),
                LongButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
