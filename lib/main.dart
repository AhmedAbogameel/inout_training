import 'package:flutter/material.dart';
import 'package:inout_training/features/sign_up/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpView(),
    );
  }
}
