import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/core/dio_helper/dio_helper.dart';
import 'package:inout_training/core/models/weather.dart';

part 'states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInit());

  static SearchCubit of(context) => BlocProvider.of(context);

  Weather? weather;

  Future<void> search(String? cityName) async {
    if(cityName == null || cityName.trim().isEmpty){
      return;
    }
    emit(SearchLoading());
    try{
      final response = await DioHelper.get('q=$cityName');
      weather = Weather.fromJson(response.data);
    } on DioError catch(e){
      print(e.message);
      weather = null;
    } catch(e){
      weather = null;
      print(e);
    }
    emit(SearchInit());
  }

}