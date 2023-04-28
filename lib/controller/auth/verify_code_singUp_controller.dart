
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handing_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/data_source/remote/auth/verify_code_singup.dart';
abstract class VerifyCodeSingUPController extends GetxController
{
  checkCodeAndToHome(String verifyCode);
  reSend();

}

class VerifyCodeSingUPControllerImp extends VerifyCodeSingUPController
{

  String? email;
  StatusRequest? statusRequest;
  MyServices myServices=Get.find();
  VerifyCodeSingUP verifyCodeSingUP = VerifyCodeSingUP(Get.find());

  @override
  checkCodeAndToHome(String verifyCode)async
  {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSingUP.postData(
        verifyCode,
        email!,
    );
    print("=============================== Controller $response ");
    print(email);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.login);
        Get.snackbar('58'.tr, "38".tr,backgroundColor: AppColor.green,);
        myServices.sharedPreferences.setBool("home", true);
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
  @override
  reSend() {
    verifyCodeSingUP.reSendData(email!);
  }

}