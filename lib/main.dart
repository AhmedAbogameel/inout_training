import 'package:flutter/material.dart';
import 'package:inout_training/register/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterView(),
    );
  }
}
