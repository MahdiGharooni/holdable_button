import 'package:flutter/material.dart';
import 'package:holdable_button/holdable_button.dart';

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
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: HoldableButton(
            width: 300,
            height: 200,
            buttonColor: Colors.blue,
            loadingColor: Colors.red,
            duration: 4,
            radius: 16,
            strokeWidth: 8,
            onConfirm: () {
              debugPrint("OnConfirm");
            },
            child: const Text(
              'Hold Me',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
