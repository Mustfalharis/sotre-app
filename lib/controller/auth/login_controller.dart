import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/color.dart';
import 'package:store_getx/core/services/services.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handing_data_controller.dart';
import '../../data/data_source/remote/auth/login.dart';
abstract class LoginController extends GetxController
{
  login();
  goToSingUP();
  goToForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController
{

  late TextEditingController? emailController;
  late TextEditingController? passwordController;
  GlobalKey<FormState> formState= GlobalKey<FormState>();
  bool isShowPassword = true;
  StatusRequest? statusRequest;
  LoginData signupData = LoginData(Get.find());
  MyServices myServices=Get.find();
  @override
  login()async
  {
   var formData=formState.currentState;
   if(formData!.validate())
     {
       statusRequest = StatusRequest.loading;
       update();
       var response = await signupData.postData(
           passwordController!.text,
           emailController!.text,
       );
       print("=============================== Controller $response ");
       statusRequest = handlingData(response);
       if (StatusRequest.success == statusRequest) {
         if (response['status'] == "success") {
           if(response['data']['users_approve']=="1")
             {
               myServices.sharedPreferences.setString("id", response['data']['users_id']) ;
               myServices.sharedPreferences.setString("username", response['data']['users_name']) ;
               myServices.sharedPreferences.setString("email", response['data']['users_email']) ;
               myServices.sharedPreferences.setString("phone", response['data']['users_phone']) ;
               Get.offAllNamed(AppRoute.home);
               myServices.sharedPreferences.setBool("home", true);
               Get.snackbar('58'.tr, "38".tr,backgroundColor: AppColor.green,);
             }
           else {
               Get.toNamed(AppRoute.verifyCodeSingUP,arguments: {
                 "email":emailController!.text,
               });
             }
         } else {
           Get.defaultDialog(title: "53".tr,middleText: "56".tr) ;
           statusRequest = StatusRequest.failure;
         }
       }
       update();
     }
  }

@override
  goToSingUP()
  {
    Get.offNamed(AppRoute.singUp);

  }

  @override
  void onInit() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword()
  {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

}