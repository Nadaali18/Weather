import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherApi{
  final Dio dio;
  WeatherApi(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName})async{
   try {
  Response response =await dio.get('http://api.weatherapi.com/v1/forecast.json?key=7be3ab4d3a1d4eeea41111807242210&q=$cityName&days=7');
    WeatherModel weatherModel =WeatherModel.fromJson(response.data);
    return weatherModel;

} on DioException catch (e) {
  final String errorMessage = e.response?.data['error']['message']??'Oops there was an error, try later';
  throw Exception(errorMessage);
}catch (e){
  log(e.toString());
  throw Exception('Oops there was an error, try later');
}
  }
   
}