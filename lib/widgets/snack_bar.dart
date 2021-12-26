import 'package:flutter/material.dart';
import 'package:inout_training/core/router/router.dart';

showSnackBar(String message, {bool isError = false}) =>
    ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.blue,
      ),
    );
