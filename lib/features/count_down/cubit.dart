import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class CountDownCubit extends Cubit<CountDownStates> {
  CountDownCubit() : super(CountDownInit());

  static CountDownCubit of(context) => BlocProvider.of(context);

  late int counter;

  Timer? _timer;

  Stream<int> flood() async* {
    for(int i = 5; i >= 0; i--){
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  // ignore: cancel_subscriptions
  StreamSubscription<int>? _streamSubscription;

  void startCount() {
    counter = 5;
    emit(CountDownCounting());
    _streamSubscription = flood().listen((event) {
      counter = event;
      emit(CountDownCounting());
      if(counter == 0){
        _streamSubscription!.cancel();
        emit(CountDownInit());
      }
    });
    // _timer = Timer.periodic(
    //   Duration(seconds: 1),
    //   (t) {
    //     if(counter == 0){
    //       t.cancel();
    //       emit(CountDownInit());
    //     }else {
    //       counter--;
    //       emit(CountDownCounting());
    //     }
    //   },
    // );
  }

  @override
  Future<void> close() {
    if(_timer != null){
      _timer!.cancel();
    }
    if(_streamSubscription != null){
      _streamSubscription!.cancel();
    }
    return super.close();
  }

}
