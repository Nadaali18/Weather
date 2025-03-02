import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api.dart';

class GetWeatherCubit extends Cubit<WeatherState>
{
     GetWeatherCubit() : super(NoWeatherState());
     WeatherApi? weatherService;
     WeatherModel? weatherModel;

     getWeather({required String cityName}) async {
      try {
         weatherModel = await weatherService!.getCurrentWeather(cityName: cityName);
        emit(WeatherLoadedState(weatherModel!));
      }  catch (e) {
          emit(WeatherFailureState());
      }
     
    }
}