import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/custom_text.dart';

class Search extends StatelessWidget {
   Search({super.key});

 final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
           decoration:const  BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Colors.purple,
            Color.fromARGB(255, 171, 71, 188),
            Color.fromRGBO(240, 98, 146, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
        ),
          child: SingleChildScrollView(
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
                   const SizedBox(width: 8,),
                   const CustomText('Search',color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset('assets/images/weather1.png'),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: TextField(
                    controller: controller,
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
                      hintStyle:const TextStyle(color:  Colors.white60),
                      suffixIcon:  IconButton(
                        onPressed: () {
                          String cityName =controller.text;
                          var getWeatherCubit =  BlocProvider.of<GetWeatherCubit>(context);
                          getWeatherCubit.getWeather(cityName: cityName);
                          Navigator.pop(context);
                        },
                        icon:const Icon(Icons.search,color: Colors.white60,) )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
