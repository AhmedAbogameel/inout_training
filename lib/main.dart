import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inout_training/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: View(),
    );
  }
}

/*
flutter pub run easy_localization:generate -f keys -o locale_keys.dart -S ./assets/translations -O ./assets/translations
 */