import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inout_training/core/validator/validator.dart';
import 'package:inout_training/features/home/view.dart';
import 'package:inout_training/features/sign_up/controller.dart';
import 'package:inout_training/widgets/input_form_field.dart';
import 'package:inout_training/widgets/snack_bar.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpController controller = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            InputFormField(
              hint: 'Email',
              validator: Validator.email,
              onSaved: (v) => controller.email = v!,
            ),
            InputFormField(
              hint: 'Password',
              validator: Validator.password,
              onSaved: (v) => controller.password = v!,
            ),
            controller.isLoading
                ? CupertinoActivityIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() => controller.isLoading = true);
                      final message = await controller.signUp();
                      if(message == 'ok') {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView(),));
                      } else if(message != null && message.isNotEmpty){
                        showSnackBar(context, message, isError: true);
                      }
                      setState(() => controller.isLoading = false);
                    },
                    child: Text('Register Now'),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an account ?'),
                TextButton(onPressed: () {}, child: Text('Login now!')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
