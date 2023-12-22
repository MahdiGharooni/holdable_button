import 'package:flutter/material.dart';
import 'package:holdable_button_example/buttons/circle_button.dart';
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
          title: const Text('Holdable Button'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              RectangleButton(),
              CircleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
