import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message, {bool isError = false}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.blue,
      ),
    );
