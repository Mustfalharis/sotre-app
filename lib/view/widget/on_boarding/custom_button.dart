
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/controller/on_boarding_controller.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';
class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 4),
        onPressed: ()
        {
          controller.next();
        },
        color: AppColor.primaryColor,
        child:  Text(
          '8'.tr,
          style: const TextStyle(
            color: Colors.white,
          ),),
      ),
    );
  }
}
