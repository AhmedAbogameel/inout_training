import 'package:flutter/material.dart';

class SignUpLoginSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Have an account ?'),
        TextButton(onPressed: () {}, child: Text('Login now!')),
      ],
    );
  }
}
