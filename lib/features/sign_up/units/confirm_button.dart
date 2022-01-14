import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/features/sign_up/controller.dart';
import 'package:inout_training/features/sign_up/states.dart';

class SignUpConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => state is SignUpLoading
          ? CupertinoActivityIndicator()
          : ElevatedButton(
              onPressed: cubit.signUp,
              child: Text('Register Now'),
            ),
    );
  }
}

/*


? CupertinoActivityIndicator()
                  :

 */
