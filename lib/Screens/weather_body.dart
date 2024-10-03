import 'package:flutter/material.dart';
import 'package:weather_app/Screens/search.dart';
import 'package:weather_app/widgets/custom_column.dart';
import 'package:weather_app/widgets/custom_container.dart';
import 'package:weather_app/widgets/custom_text.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> const Search(),),);
            },
            icon: const Icon(Icons.search_rounded,color: Colors.white,)),
          )
        ],
      ),
      body: ListView(
        children:  [
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const CustomColumn(text1: '32°',size1: 40, text2: 'Meet Abo Ali ',size2: 30,icon: Icons.location_on,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Image.asset('assets/images/clear.png'),
             ),
            ],
          ),
          const SizedBox(height: 20,),
          const CustomColumn(text1: ' 35°/22° Feels like 35°',size1: 15, text2:'Mon, 1:16 pm',size2: 15,),   
          const SizedBox(height: 30,),
          const CustomContainer(
            height: 280,
            child: SingleChildScrollView(
              child: Column(
                  children: [
                  CustomRow(
                    day: 'Sunday',
                    rainPercentage: '3%',
                    degree: '32°/22°',
                    dayImage: 'assets/images/clear.png',
                  ),
                  CustomRow(
                    day: 'Sunday',
                    rainPercentage: '3%',
                    degree: '32°/22°',
                    dayImage: 'assets/images/clear.png',
                  ),
                  CustomRow(
                    day: 'Sunday',
                    rainPercentage: '3%',
                    degree: '32°/22°',
                    dayImage: 'assets/images/clear.png',
                  ),
                  CustomRow(
                    day: 'Sunday',
                    rainPercentage: '3%',
                    degree: '32°/22°',
                    dayImage: 'assets/images/clear.png',
                  ),
                  CustomRow(
                    day: 'Sunday',
                    rainPercentage: '3%',
                    degree: '32°/22°',
                    dayImage: 'assets/images/clear.png',
                  ),
                  CustomRow(
                    day: 'Sunday',
                    rainPercentage: '3%',
                    degree: '32°/22°',
                    dayImage: 'assets/images/clear.png',
                  ),
                  CustomRow(
                    day: 'Sunday',
                    rainPercentage: '3%',
                    degree: '32°/22°',
                    dayImage: 'assets/images/clear.png',
                  ),
                  ],
              ),
            ),
            ),
          const SizedBox(height: 30,),
          const CustomContainer(
            height: 180, 
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomColumn2(
                    text1: 'Sunrise',
                    text2: '6:42 am',
                    image:'assets/images/sunrise.png',
                  ),
                ),
                Expanded(
                  child: CustomColumn2(
                    text1: 'Sunset',
                    text2: '6:50 pm',
                    image: 'assets/images/sunset.png',
                  ),
                ),
              ],
            )
            ),
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.day,
    required this.rainPercentage,
    required this.degree,
    required this.dayImage,

  });
final String day;
final String rainPercentage;
final String degree;
final String dayImage;
final String nightImage ='assets/images/nightImage.png';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,right: 8,left: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CustomText(day,color: Colors.white,fontSize: 20,),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                const Icon(Icons.water_drop_sharp,color: Colors.grey,),
                CustomText(rainPercentage,color: Colors.white,fontSize: 16,),
              ],
            ),
          ),
          Image.asset(dayImage,height: 30,width: 40,),
          Image.asset(nightImage,height: 25,width: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: CustomText(degree,color: Colors.white,fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomColumn2 extends StatelessWidget {
  const CustomColumn2({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
  });
final String text1;
final String text2;
final String image;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: CustomText(text1,color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),
       ),
       CustomText(text2,color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,),
       Image.asset(image,height: 100,width: 200,),
      ],
    );
  }
}

