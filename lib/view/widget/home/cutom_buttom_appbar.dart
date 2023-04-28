
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/core/constant/color.dart';
class CustomButtonAppBar extends StatelessWidget {
  final VoidCallback onPressed;
  final String textButton;
  final IconData iconData;
  final bool? active;
  const  CustomButtonAppBar({super.key, required this.onPressed, required this.textButton, required this.iconData,required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: active==true? AppColor.primaryColor:AppColor.black,
        ),
        // Text(textButton,
        //   style: TextStyle(
        //   color: active==true? AppColor.primaryColor:AppColor.black,
        // ),),
      ],
    ),
    );
  }
}
