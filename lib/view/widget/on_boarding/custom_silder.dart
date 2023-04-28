

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/controller/on_boarding_controller.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';

import '../../../data/data_source/static/static.dart';
class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      itemCount: onBoardingList.length,
      onPageChanged:(index)
      {
        controller.onPageChanged(index);
      },
      itemBuilder: (BuildContext context, int index)=>Column(
        children:
        [
          // const SizedBox(
          //   height: 100,
          // ),
          Image.asset(
            onBoardingList[index].image!,
            height: 300,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            onBoardingList[index].title!.tr,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[index].body!.tr,
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
