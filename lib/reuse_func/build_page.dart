import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget BuildPage({
  required String title,
  required String text,
  required String imageName,
  required Color color,
  required Color titleColor,
  required Color textColor,
}){
  return SafeArea(
    child: Container(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SvgPicture.asset(
              'assets/svgs/$imageName.svg',
              height: 300,
              width: 300,
              ),
          ),
          SizedBox(height: 30,),
          Text(
            title,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 17,
                fontWeight: FontWeight.bold 
              ),
            ),
          )
        ],
      ),
    ),
  );
}