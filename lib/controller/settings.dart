
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';
import 'package:store_getx/core/services/services.dart';
abstract class SettingsController extends GetxController
{
logOut();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices=Get.find();
  @override
  logOut()
  {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }





}