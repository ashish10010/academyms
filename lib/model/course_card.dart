import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String image;
  final Color backgroundColor;


  const CourseCard({super.key,
  required this.title,
  required this.image,
  required this.backgroundColor,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin:const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontFamily: "Lato-Reg",
            fontSize: 20,
          ),
         ),           
          const SizedBox(height: 15,),
         Center(
           child: Image(image: AssetImage(image),
              height: 250,
           ),
         ),
        ],
      ),
    );
  }
}