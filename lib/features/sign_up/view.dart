import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/core/validator/validator.dart';
import 'package:inout_training/features/home/view.dart';
import 'package:inout_training/features/sign_up/controller.dart';
import 'package:inout_training/features/sign_up/units/fields.dart';
import 'package:inout_training/widgets/input_form_field.dart';
import 'package:inout_training/widgets/snack_bar.dart';

import 'units/confirm_button.dart';
import 'units/login_section.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SignUpFields(),
            SignUpConfirmButton(),
            SignUpLoginSection(),
          ],
        ),
      ),
    );
  }
}
