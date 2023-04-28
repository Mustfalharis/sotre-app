import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/routes.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handing_data_controller.dart';
import '../../../data/data_source/remote/auth/forget_password/check_email.dart';
abstract class ForgetPasswordController extends GetxController
{
  goToVerifyCode();

}

class ForgetPasswordControllerImp extends ForgetPasswordController
{
  late TextEditingController? emailController;
  GlobalKey<FormState> formState= GlobalKey<FormState>();

  StatusRequest? statusRequest;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  @override
  void onInit() {
    emailController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    emailController!.dispose();
    super.dispose();
  }
  @override
  goToVerifyCode()async
  {
    var formData=formState.currentState;
    if(formData!.validate())
    {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(
        emailController!.text,
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifyCode,arguments: {
            'email':emailController!.text,
          });
        } else {
          Get.defaultDialog(title: "53".tr,middleText: "57".tr) ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();

    }
  }


}