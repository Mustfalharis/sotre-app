import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/routes.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handing_data_controller.dart';
import '../../../data/data_source/remote/auth/forget_password/verify_code_forget_password.dart';
import '../../../data/data_source/remote/auth/verify_code_singup.dart';
abstract class VerifyCodeController extends GetxController
{
  checkCode(String verifyCode);

}

class VerifyCodeControllerImp extends VerifyCodeController
{

  String? email;

  StatusRequest? statusRequest;
  VerifyCodeSingFPData  verifyCodeSingFP = VerifyCodeSingFPData(Get.find());
  @override
  checkCode(String verifyCode ) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSingFP.postData(
      verifyCode,
      email!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.restPassword,arguments: {"email":email});
      } else {
        Get.defaultDialog(title: "53".tr,middleText: "55".tr) ;
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }
  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }
}