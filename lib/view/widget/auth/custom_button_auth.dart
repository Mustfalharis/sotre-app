

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
    const CustomButtonAuth({Key? key, required this.text,required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:  10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding:const  EdgeInsets.symmetric(vertical: 13),
          onPressed: onPressed,
         color: AppColor.primaryColor,
          child:Text(
            text,
          style:const  TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
