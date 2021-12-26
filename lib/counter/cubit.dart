import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/counter/states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInit());

  static CounterCubit of(context) => BlocProvider.of(context);

  int counter = 0;

  void plus() {
    counter++;
    emit(CounterPlus());
  }

  void minus() {
    counter--;
    emit(CounterMinus());
  }

}