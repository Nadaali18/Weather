import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.height,
    required this.child,
  });
final double height;
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}