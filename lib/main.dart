import 'package:flutter/material.dart';

import 'controller.dart';
import 'view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
      stream: Controller.themeStreamController.stream,
      initialData: ThemeMode.light,
      builder: (context, snapshot) => MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: snapshot.data,
        home: View(),
      ),
    );
  }
}
