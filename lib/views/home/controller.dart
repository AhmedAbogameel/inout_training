import 'dart:convert';

import 'package:dio/dio.dart';

class HomeController {

  Dio _dio = Dio();

  Future<List<dynamic>> getCharacters() async {
    final response = await _dio.get('https://breakingbadapi.com/api/characters');
    if(response.statusCode == 200){
      final character = response.data;
      return character;
    }else{
      print('error!');
      return [];
    }
  }

}

/*
Http / Dio / Retrofit / Chopper

dio
Status Code != 200 - 299 > Exception

 */