import 'package:flutter/material.dart';
import 'core/router/router.dart';
import 'features/splash/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: SplashView(),
    );
  }
}
