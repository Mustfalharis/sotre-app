import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handing_data_controller.dart';
import '../../../core/services/services.dart';
import '../../../data/data_source/remote/auth/forget_password/rest_password.dart';
abstract class RestPasswordController extends GetxController
{

  showPassword();
  goToSuccessResetPassword();
}

class RestPasswordControllerImp extends RestPasswordController
{
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  GlobalKey<FormState> formState= GlobalKey<FormState>();
  StatusRequest? statusRequest;
  MyServices myServices=Get.find();
  RestPasswordData restPasswordData = RestPasswordData(Get.find());
  bool isShowPassword = true;
  String? email;
  @override
  goToSuccessResetPassword() async {
    if (passwordController.text != rePasswordController.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }
    var formData=formState.currentState;
    if(formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await restPasswordData.postData(
        passwordController.text,
        email!,
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.login);
          myServices.sharedPreferences.setBool("home", true);
          Get.snackbar('58'.tr, "38".tr,backgroundColor: AppColor.green,);
        } else {
          Get.defaultDialog(title: "53".tr, middleText: "57".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();

    }
  }

    @override
  void onInit() {
    email = Get.arguments['email'];
    passwordController=TextEditingController();
    rePasswordController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

}