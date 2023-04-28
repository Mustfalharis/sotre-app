import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';
import 'package:store_getx/core/services/services.dart';

import '../data/data_source/static/static.dart';


abstract class OnBoardingController extends GetxController
{
  next();
  onPageChanged(int index);

}

class OnBoardingControllerImp extends OnBoardingController
{
  late PageController pageController;
  int currentPage=0;
  MyServices myServices=Get.find();
  @override
  next()
  {
    currentPage++;
    if(currentPage>onBoardingList.length-1)
      {
        myServices.sharedPreferences.setBool('onBoarding', true);
        Get.offAllNamed(AppRoute.login);
      }
    else
      {
    pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index)
  {
    currentPage=index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

}