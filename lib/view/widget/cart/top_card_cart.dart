

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String title;
  final String titleTwo;
  const TopCardCart({Key? key, required this.title, required this.titleTwo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      padding:const EdgeInsets.only(bottom: 5,),
      decoration: BoxDecoration(
        color: AppColor.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
             title,
            textAlign:TextAlign.center,
            style: const TextStyle(
              color:AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
         const SizedBox(width: 4,),
         Text(
           titleTwo,
          textAlign:TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color:Colors.white,
            fontWeight: FontWeight.bold,
          ),
          ),
        ],
      ),
    );
  }
}
