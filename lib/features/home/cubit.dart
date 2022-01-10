import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/core/dio_helper/dio_helper.dart';
import 'package:inout_training/core/models/weather.dart';

part 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context) => BlocProvider.of(context);

  Weather? weather;

  Future<void> getCurrentWeather() async {
    emit(HomeLoading());
    try{
      final response = await DioHelper.get('lat=31&lon=31');
      weather = Weather.fromJson(response.data);
    }catch(e){
      print(e);
    }
    emit(HomeInit());
  }

}