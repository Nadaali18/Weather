import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_text.dart';

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

