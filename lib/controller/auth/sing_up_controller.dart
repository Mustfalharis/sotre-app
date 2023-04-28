import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handing_data_controller.dart';
import '../../data/data_source/remote/auth/sing_up.dart';
abstract class SingUpController extends GetxController
{
  signUp();
  goToLogin();
  showPassword();
}

class SingUpControllerImp extends SingUpController
{
  late TextEditingController? emailController;
  late TextEditingController? passwordController;
  late TextEditingController? userNameController;
  late TextEditingController? phoneController;
  GlobalKey<FormState> formState= GlobalKey<FormState>();
  bool isShowPassword = true;
   StatusRequest? statusRequest;
  SignUpData signupData = SignUpData(Get.find());
  @override
  signUp()async
  {
    if(formState.currentState!.validate())
    {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          userNameController!.text,
          passwordController!.text,
          emailController!.text,
          phoneController!.text
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifyCodeSingUP,arguments:{
            "email":emailController!.text,
          } );
        } else {
          Get.defaultDialog(title: "53".tr,middleText: "54".tr) ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }












  @override
  goToLogin()
  {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
    phoneController=TextEditingController();
    userNameController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    phoneController!.dispose();
    userNameController!.dispose();
    super.dispose();
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

}