import 'package:flutter/cupertino.dart';
import 'package:store_getx/controller/on_boarding_controller.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';

import '../../../data/data_source/static/static.dart';
class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller)=>Expanded(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(onBoardingList.length, (index) => AnimatedContainer(
            margin: const EdgeInsets.only(right: 5),
            duration: const Duration(milliseconds: 900),
            width: controller.currentPage==index? 20:6,
            height: 6,
            decoration:  BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),)
        ],),
      ),
    );

  }
}
