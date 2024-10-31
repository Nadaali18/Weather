import 'package:flutter/material.dart';
import 'package:weather_app/Screens/search.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/custom_column.dart';
import 'package:weather_app/widgets/custom_column2.dart';
import 'package:weather_app/widgets/custom_container.dart';
import 'package:weather_app/widgets/custom_text.dart';


class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key,required this.weatherModel});
 final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration:  BoxDecoration(
        gradient: LinearGradient(colors: [
         getWeatherColor(weatherModel.condition)[700]!,
         getWeatherColor(weatherModel.condition)[600]!,
         getWeatherColor(weatherModel.condition),
         getWeatherColor(weatherModel.condition)[400]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        )
      ),
        child: ListView(
          children:  [
            Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=> const Search(),),);
              },
              icon: const Icon(Icons.search_rounded,color: Colors.white,)),
            ),
          ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomColumn(
                  text1: '${weatherModel.temp.round()}°',
                  size1: 40, 
                  text2: weatherModel.cityName,
                  size2: 30,
                  icon: Icons.location_on,
                  ),
               Image.network('http:${weatherModel.image}',width: 120,height: 120,fit: BoxFit.cover,),
              ],
            ),
               const SizedBox(height: 20,),
               CustomColumn(
                 text1:' ${weatherModel.maxtemp.round()}° / ${weatherModel.mintemp.round()}° Feels like ${weatherModel.maxtemp.round()}°',
                 size1: 15, 
                 text2:'Updated at ${weatherModel.lastUpdated.hour}:${weatherModel.lastUpdated.minute}',
                 size2: 15,
                ),   
               const SizedBox(height: 30,),
               CustomContainer(
                  height: 280,
                  child: SingleChildScrollView(
                  child: Column(
                    children: [
                    SizedBox(height:6),
                    for (int index = 0; index < weatherModel.forecastDays.length; index++)
                    buildWeatherRow(index),
                    ],
                ),
              ),
              ),
            const SizedBox(height: 30,),
            CustomContainer(
              height: 180, 
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomColumn2(
                      text1: 'Sunrise',
                      text2: weatherModel.sunrise,
                      image:'assets/images/sunrise.png',
                    ),
                  ),
                  Expanded(
                    child: CustomColumn2(
                      text1: 'Sunset',
                      text2: weatherModel.sunset,
                      image: 'assets/images/sunset.png',
                    ),
                  ),
                ],
              )
              ),
          ],
        ),
      ),
    );
  }
  Widget buildWeatherRow(int index) {
  final dayData = weatherModel.forecastDays[index];
  final String dayLabel = index == 0 ? "Today" : weatherModel.getDayName(dayData['date']);
  const String nightImage = 'assets/images/nightImage.png';

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,  
      children: [
        
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: SizedBox(
            width: 120,  
            child: CustomText(
              dayLabel,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        
        // عنصر UV مع أيقونة الماء
        Row(
          children: [
            Icon(
              Icons.water_drop_sharp,
              color: Colors.grey[400],
              size: 15,
            ),
            CustomText(
              dayData['day']['uv'].round().toString(),
              color: Colors.white,
              fontSize: 15,
            ),
          ],
        ),
        Row(
          children:[
          Image.network(
          'http:${dayData['day']['condition']['icon']}',
          height: 30,
          width: 40,
        ),
        Image.asset(
          nightImage,
          height: 25,
          width: 40,
        ),
        ]),
        SizedBox(
          width: 100,  
          child: CustomText(
            '${dayData['day']['maxtemp_c'].round()}° / ${dayData['day']['mintemp_c'].round()}°',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
}