import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherApi{
  final String domain ='http://api.weatherapi.com';
  final String apiKey='3e8781c712cf4769a3e62023242409';
  final Dio dio;
  WeatherApi(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName})async{
   try {
  Response response =await dio.get('$domain/v1/forecast.json?key=$apiKey&q=$cityName&days=7');
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