import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/core/app_storage/app_storage.dart';
import 'package:inout_training/core/dio_helper/dio_helper.dart';
import 'package:inout_training/core/router/router.dart';
import 'package:inout_training/features/home/view.dart';
import 'package:inout_training/features/sign_up/states.dart';
import 'package:inout_training/widgets/snack_bar.dart';

class SignUpCubit extends Cubit<SignUpStates>{
  SignUpCubit() : super(SignUpInit());

  static SignUpCubit of(context) => BlocProvider.of(context);

  late String email;
  late String password;
  final formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if(!formKey.currentState!.validate()) return null;
    formKey.currentState!.save();
    emit(SignUpLoading());
    final body = {
      "email": email,
      "password": password,
      "returnSecureToken": true
    };
    try{
      final response = await DioHelper.post('signUp', data: body);
      if(response.statusCode == 200){
        await AppStorage.cacheUserData(email: email, apiToken: response.data['idToken'], uid: response.data['localId']);
        MagicRouter.navigateAndPopAll(HomeView());
      } else {
        showSnackBar(response.data['error']['message'], isError: true);
      }
    } on DioError catch (e){
      showSnackBar(e.message, isError: true);
    } catch(e){
      showSnackBar(e.toString(), isError: true);
    }
    emit(SignUpInit());
  }

}