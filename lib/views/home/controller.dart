import 'package:dio/dio.dart';
import 'package:inout_training/models/character.dart';

class HomeController {

  Dio _dio = Dio();

  Future<List<Character>> getCharacters() async {
    _dio.options.validateStatus = (v) => v! < 500;
    List<Character> characters = [];
    try{
      final response = await _dio.get('https://breakingbadapi.com/api/characters');
      final data = response.data as List;
      data.forEach((element) => characters.add(Character.fromJson(element)));
    } on DioError catch(e) {
      print(e.message);
    } catch (e){
      print(e.toString());
    }
    return characters;
  }

}

/*
Http / Dio / Retrofit / Chopper

dio
Status Code != 200 - 299 > Exception

 */