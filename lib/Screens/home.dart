import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/no_weather_body.dart';
import 'package:weather_app/Screens/weather_body.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context,state){
         if (state is NoWeatherState){
          return const NoWeatherBody();
         }else if(state is WeatherLoadedState){
          return  WeatherBody(
            weatherModel: state.weatherModel,
          );
         }else{
          return const NoWeatherBody();
         }
            }
        ),
    );
  }
}