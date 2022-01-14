
import 'package:flutter/material.dart';
import 'package:inout_training/core/validator/validator.dart';
import 'package:inout_training/features/sign_up/controller.dart';
import 'package:inout_training/widgets/input_form_field.dart';

class SignUpFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.of(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          InputFormField(
            hint: 'Email',
            validator: Validator.email,
            onSaved: (v) => cubit.email = v!,
          ),
          InputFormField(
            hint: 'Password',
            validator: Validator.password,
            onSaved: (v) => cubit.password = v!,
          ),
        ],
      ),
    );
  }
}
