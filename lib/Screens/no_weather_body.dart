import 'package:flutter/material.dart';
import 'package:weather_app/Screens/search.dart';
import 'package:weather_app/widgets/custom_text.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
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
      body:const Center(
        child: Column(
         mainAxisSize: MainAxisSize.min,
          children: [
           CustomText('There is no weather ',color: Colors.white,fontSize: 30,),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 4),
                child: CustomText('Start Searching now',color: Colors.blue,fontSize: 15,),
              ),
              SizedBox(width: 5,),
              Icon(Icons.search,color: Colors.white,),
            ],
          ),
          ],
        ),
      ),
    );
  }
}