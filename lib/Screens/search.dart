import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/custom_text.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
         decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.purple,
          Colors.pink,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        )
      ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                 Navigator.pop(context);
               }, icon:const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),
               SizedBox(width: 8,),
               const CustomText('Search',color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onSubmitted: (value) async {
                  var getWeatherCubit =  BlocProvider.of<GetWeatherCubit>(context);
                     getWeatherCubit.getWeather(cityName: value);
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
