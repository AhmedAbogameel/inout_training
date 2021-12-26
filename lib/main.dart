import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/counter/counter_plus/view.dart';
import 'package:inout_training/counter/cubit.dart';
import 'package:inout_training/register/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit(),)
      ],
      child: MaterialApp(
        home: CounterPlusView(),
        // home: RegisterView(),
      ),
    );
  }
}
