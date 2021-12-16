import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final String? hint;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  InputFormField({
    this.hint,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: _getBorder(Colors.black26),
          focusedBorder: _getBorder(Colors.blue),
          errorBorder: _getBorder(Colors.red),
          focusedErrorBorder: _getBorder(Colors.blue),
        ),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }

  InputBorder _getBorder(Color color) => OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(8),
      );
}
