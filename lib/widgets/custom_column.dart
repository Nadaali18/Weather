import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_text.dart';

class CustomColumn extends StatelessWidget {
  const CustomColumn({super.key,required this.text1,required this.text2,this.icon,required this.size1,required this.size2});
final dynamic text1;
final dynamic text2;
final IconData? icon;
final double size1;
final double size2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(text1,color: Colors.white,fontSize: size1,fontWeight: FontWeight.bold,),
          Row(
            children: [
              CustomText(text2,color: Colors.white,fontSize: size2,fontWeight: FontWeight.bold,),
              Icon(icon,color: Colors.white,),
            ],
          ),
        ],
      ),
    );
  }
}