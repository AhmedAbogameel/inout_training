import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/register/states.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInit());

  static RegisterCubit of(context) => BlocProvider.of(context);

  bool isTermsAccepted = false;

  void toggleTerms(bool value) {
    isTermsAccepted = value;
    emit(RegisterInit());
  }

}