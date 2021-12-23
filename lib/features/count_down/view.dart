import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/features/count_down/cubit.dart';
import 'package:inout_training/features/count_down/states.dart';

class CountDownView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CountDownCubit()..startCount(),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<CountDownCubit, CountDownStates>(
            builder: (context, state) {
              final cubit = CountDownCubit.of(context);
              if (state is CountDownInit) {
                return TextButton(
                  onPressed: cubit.startCount,
                  child: Text('Resend Code'),
                );
              }
              return Text(
                '00:${cubit.counter.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 20),
              );
            },
          ),
        ),
      ),
    );
  }
}
