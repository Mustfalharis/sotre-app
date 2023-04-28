
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/core/constant/color.dart';

class CustomTextSingUpOrSingIn extends StatelessWidget {
   final String textOne;
   final String textTwo;
  final  GestureTapCallback ontap;
   const CustomTextSingUpOrSingIn({Key? key, required this.textOne, required this.textTwo, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text(textOne),
        InkWell(
          onTap: ontap,
          child:  Text(
            textTwo,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
