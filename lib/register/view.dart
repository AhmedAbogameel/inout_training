import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/register/cubit.dart';
import 'package:flutter/cupertino.dart';

part 'units/terms_tile.dart';
part 'units/confirm_button.dart';
part 'units/terms_dialog.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            _TermsTile(),
            _ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
