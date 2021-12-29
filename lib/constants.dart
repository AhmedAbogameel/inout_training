import 'package:flutter/material.dart';

double sizeFromHeight (BuildContext context, double fraction) {
  if(fraction <= 0)
    fraction = 1;
  final mediaQuery = MediaQuery.of(context);
  final height = mediaQuery.size.height;
  fraction = (height - mediaQuery.padding.top - AppBar().preferredSize.height) / fraction;
  return fraction;
}

double sizeFromWidth (BuildContext context, double fraction) {
  if(fraction <= 0)
    fraction = 1;
  final mediaQuery = MediaQuery.of(context);
  final width = mediaQuery.size.width;
  return width / fraction;
}