// ignore_for_file: close_sinks

import 'dart:async';

import 'package:flutter/material.dart';

class Controller {

  StreamController<int> streamController = StreamController<int>();

  int counter = 0;

  void plus() {
    counter++;
    streamController.sink.add(counter);
    toggleTheme();
  }

  static StreamController<ThemeMode> themeStreamController = StreamController<ThemeMode>();

  static ThemeMode themeMode = ThemeMode.light;

  static void toggleTheme() {
    if(themeMode == ThemeMode.dark){
      themeMode = ThemeMode.light;
    }else {
      themeMode = ThemeMode.dark;
    }
    themeStreamController.sink.add(themeMode);
  }


}