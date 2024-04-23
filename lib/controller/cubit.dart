import 'package:api_http/controller/states.dart';
import 'package:api_http/core/class/curd.dart';
import 'package:api_http/core/class/request_state.dart';
import 'package:api_http/core/function/handel_request.dart';
import 'package:api_http/model/local/weather_model.dart';
import 'package:api_http/model/remote/get_weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

  GetWeatherRemoteData getWeatherData = GetWeatherRemoteData(Curd());
  RequestState? states;
  WeatherModel? model;

  getWeather(String cityName) async {
    emit(WeatherLoadingState());
    final result = await getWeatherData.getWeather(cityName: cityName);
    states = handleRequest(result);
    if (states == RequestState.loaded) {
      //print(result);
      emit(WeatherSuccessState());
      model = WeatherModel.fromJson(result);
    } else {
      emit(WeatherErrorState(states.toString()));
    }
  }
}
