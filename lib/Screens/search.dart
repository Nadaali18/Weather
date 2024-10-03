
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api.dart';
import 'package:weather_app/widgets/custom_text.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),
        title:const CustomText('Search',color: Colors.white,),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) async {
                WeatherModel weatherModel = await WeatherApi(Dio()).getCurrentWeather(cityName: value);
                log(weatherModel.cityName);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:const BorderSide(
                    color: Colors.white
                    ),
                  borderRadius: BorderRadius.circular(15),
                ),
                 enabledBorder: OutlineInputBorder(
                  borderSide:const BorderSide(
                    color: Colors.white
                    ),
                  borderRadius: BorderRadius.circular(15),
                ),
                label:const CustomText('Search',color: Colors.white,),
                hintText: 'Enter City Name',
                hintStyle:const TextStyle(color:  Color.fromARGB(255, 91, 90, 90)),
                suffixIcon: Icon(Icons.search,color: Colors.white,)
              ),
            ),
          ),
        ],
      ),
    );
  }
}