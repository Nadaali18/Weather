import 'package:flutter/material.dart';
import 'package:weather_app/Screens/weather_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WeatherBody(),
    );
  }
}