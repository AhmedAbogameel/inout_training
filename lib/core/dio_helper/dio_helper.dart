import 'package:dio/dio.dart';

class DioHelper {

  static const String _API_KEY = 'e48bfbc78ac07fa4af892619b231f0b2';
  static const String _BASE_URL = 'http://api.openweathermap.org/data/2.5/weather?';

  static Dio _dio = Dio()..options.baseUrl = _BASE_URL..options.validateStatus = (v) => v! < 500;

  // http://api.openweathermap.org/data/2.5/weather? lat=31&lon=31 &appid=be2acbcfe99b5fe0e4e59c3b35c3dd23
  static Future<Response<dynamic>> post(String path,{Map<String, dynamic>? formData,dynamic body,Function(int,int)? onSendProgress}){
    final response = _dio.post(path + '&appid=' + _API_KEY,data: formData != null ? formData : body,onSendProgress: onSendProgress);
    return response;
  }

  static Future<Response<dynamic>> get(String path){
    final response = _dio.get(path + '&appid=' + _API_KEY);
    return response;
  }

}