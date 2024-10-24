import 'package:flutter/material.dart';
import 'package:weather_app/Screens/search.dart';
import 'package:weather_app/widgets/custom_text.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
         mainAxisSize: MainAxisSize.min,
          children: [
           const CustomText('There is no weather ',color: Colors.white,fontSize: 30,),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding:  EdgeInsets.only(left: 4),
                child: CustomText('Start Searching now',color: Colors.blue,fontSize: 15,),
              ),
              const SizedBox(width: 5,),
               IconButton(
                onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> const Search(),),);
            },
            icon: const Icon(Icons.search_rounded,color: Colors.white,)),
            ],
          ),
          ],
        ),
      ),
    );
  }
}