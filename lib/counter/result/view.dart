import 'package:flutter/material.dart';
import 'package:inout_training/counter/cubit.dart';

class CounterResultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = CounterCubit.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          'You pressed button ${cubit.counter} time.',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
