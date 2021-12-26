import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/counter/counter_minus/view.dart';
import 'package:inout_training/counter/cubit.dart';
import 'package:inout_training/counter/result/view.dart';
import 'package:inout_training/counter/states.dart';

class CounterPlusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = CounterCubit.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Builder(builder: (context) {
          return Column(
            children: [
              BlocBuilder(
                bloc: cubit,
                // buildWhen: (previous, current) => current is CounterPlus,
                builder: (context, state) => Text(
                  cubit.counter.toString(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              ElevatedButton(
                onPressed: cubit.plus,
                child: Icon(
                  Icons.add,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CounterMinusView(),
                      // builder: (context) => BlocProvider.value(
                      //   value: cubit,
                      //   child: CounterMinusView(),
                      // ),
                    ),
                  );
                },
                child: Text('Navigate to minus'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CounterResultView(),
                    ),
                  );
                },
                child: Text('Navigate to Result'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
