import 'package:flutter/material.dart';
import 'core/app_storage/app_storage.dart';
import 'features/splash/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashView(),
    );
  }
}