import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inout_training/core/app_storage/app_storage.dart';
import 'package:inout_training/core/dio_helper/dio_helper.dart';

class SignUpController {

  bool isLoading = false;
  late String email;
  late String password;
  final formKey = GlobalKey<FormState>();

  /*
  null -> null;
  ok -> navigate;
  String -> Dialog , Snack;
   */

  Future<String?> signUp() async {
    if(!formKey.currentState!.validate()) return null;
    formKey.currentState!.save();
    final body = {
      "email": email,
      "password": password,
      "returnSecureToken": true
    };
    try{
      final response = await DioHelper.post('signUp', data: body);
      if(response.statusCode == 200){
        await AppStorage.cacheUserData(email: email, apiToken: response.data['idToken'], uid: response.data['localId']);
        return 'ok';
      } else {
        return response.data['error']['message'];
      }
      print(response.statusCode);
      print(response.data);
    } on DioError catch (e){
      return e.message;
    } catch(e){
      return e.toString();
    }
  }

}