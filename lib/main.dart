import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/home.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child:  Builder(
        builder:(context) => BlocBuilder<GetWeatherCubit,WeatherState>(
          builder: (context,state){
            return MaterialApp(
               theme: ThemeData(
               primarySwatch: getWeatherColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition),
               ),
               debugShowCheckedModeBanner: false,
               home: Home(),
              );
              }
        ),
      ),
    );
}

}


MaterialColor getWeatherColor(String? condition) {
  switch (condition?.toLowerCase()) {
    case 'sunny': 
    case 'clear': 
      return Colors.indigo;
    case 'partly cloudy': 
    case 'mist':
    case 'patchy snow possible': 
    case 'patchy freezing drizzle possible':
    case 'light drizzle': 
    case 'patchy light drizzle': 
      return Colors.blueGrey;
    case 'cloudy': 
    case 'fog': 
      return Colors.blue;
    case 'overcast':
     case 'blowing snow': 
    case 'blizzard':  
    case 'freezing fog': 
    case 'light rain': 
    case 'patchy light rain': 
    case 'moderate rain at times': 
    case 'moderate rain': 
      return Colors.brown;
    case 'patchy rain possible': 
    case 'heavy rain at times': 
    case 'heavy rain': 
    case 'light rain shower': 
    case 'moderate or heavy rain shower': 
      return Colors.purple;  
    case 'thundery outbreaks possible': 
    case 'patchy light rain with thunder': 
    case 'moderate or heavy rain with thunder': 
      return Colors.deepPurple;
    case 'light snow': 
    case 'patchy light snow': 
    case 'moderate snow': 
      return Colors.cyan;
    default:
      return Colors.purple;   
  }
}