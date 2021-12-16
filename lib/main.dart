import 'package:flutter/material.dart';
import 'package:inout_training/core/app_storage/app_storage.dart';
import 'package:inout_training/features/home/view.dart';
import 'package:inout_training/features/sign_up/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppStorage.isLogged ? HomeView() : SignUpView(),
    );
  }
}
