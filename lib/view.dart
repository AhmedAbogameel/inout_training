import 'package:flutter/material.dart';
import 'package:inout_training/constants.dart';

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);


  /*
  FreeSize
  Expanded
  Fitted
  LayoutBuilder
  Width / Height < = 30 (Fixed)
  MediaQuery
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.red,
        alignment: Alignment.topLeft,
        width: sizeFromWidth(context, 1),
        height: sizeFromHeight(context, 1),
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            color: Colors.green,
            width: constraints.maxWidth / 2,
            height: constraints.maxHeight / 2,
          ),
        ),
      ),
    );
  }
}
