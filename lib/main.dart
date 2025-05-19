import 'package:flutter/material.dart';
import 'package:todolist/ui_kit/palette.dart';
import 'package:todolist/ui_kit/widgets/check_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return MaterialApp(
      title: 'To Do List',
      home: Scaffold(
        backgroundColor: palette.backPrimary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CheckBox(onChanged: (_) {}, value: false)],
          ),
        ),
      ),
    );
  }
}
