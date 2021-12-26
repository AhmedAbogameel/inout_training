import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/counter/cubit.dart';

import '../states.dart';

class CounterMinusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = CounterCubit.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            BlocBuilder(
              bloc: cubit,
              // buildWhen: (previous, current) => current is CounterMinus,
              builder: (context, state) => Text(
                cubit.counter.toString(),
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ElevatedButton(
              onPressed: cubit.minus,
              child: Icon(
                Icons.remove,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
