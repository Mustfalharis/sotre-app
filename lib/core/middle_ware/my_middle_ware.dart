import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';
import 'package:store_getx/core/services/services.dart';
class MyMiddleWare extends GetMiddleware
{
  @override
  int? get priority =>1;
   MyServices myServices=Get.find();
 @override
  RouteSettings?redirect(String? route)
  {
    if(myServices.sharedPreferences.getBool('onBoarding')==true)
      {
        if(myServices.sharedPreferences.getBool('home')==true)
          {
            return const RouteSettings(name: AppRoute.home);
          }
        else {
          return const RouteSettings(name: AppRoute.login);
        }
      }
  }
}