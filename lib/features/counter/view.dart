import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/features/counter/cubit.dart';
import 'package:inout_training/features/counter/states.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You pressed button times :'),
              BlocBuilder<CounterCubit, CounterStates>(
                buildWhen: (previous, current) => current is CounterPlus,
                builder: (context, state) => state is CounterPlus
                    ? Text(
                        BlocProvider.of<CounterCubit>(context)
                            .counter
                            .toString(),
                        style: Theme.of(context).textTheme.headline1,
                      )
                    : SizedBox(),
              ),
              BlocBuilder<CounterCubit, CounterStates>(
                buildWhen: (previous, current) => current is CounterMinus,
                builder: (context, state) => state is CounterMinus
                    ? Text(
                        BlocProvider.of<CounterCubit>(context)
                            .counter
                            .toString(),
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    : SizedBox(),
              ),
              Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: BlocProvider.of<CounterCubit>(context).minus,
                  child: Icon(Icons.remove),
                );
              }),
            ],
          ),
        ),
        floatingActionButton: _FAB(),
      ),
    );
  }
}

class _FAB extends StatelessWidget {
  const _FAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: BlocProvider.of<CounterCubit>(context).plus,
    );
  }
}
