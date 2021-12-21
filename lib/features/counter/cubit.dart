import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/features/counter/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInit());

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