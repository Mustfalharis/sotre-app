import 'package:flutter/material.dart';
import 'package:store_getx/core/class/status_request.dart';
import '../../../controller/auth/sing_up_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/images_asset.dart';
import '../../../core/functions/alertexit_app.dart';
import '../../../core/functions/vaild_input.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_text_from_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/customte_text_body_auth.dart';
import '../../widget/auth/text_sing_up.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class SingUP extends StatelessWidget {
 const SingUP({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  Get.put(SingUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '17'.tr,
          style: const TextStyle(
              fontSize: 20, color: AppColor.grey, fontWeight: FontWeight.bold),
        ),
      ),
      body:  WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SingUpControllerImp>(
          builder: (controller)=>ConditionalBuilder(
            condition: controller.statusRequest==StatusRequest.loading,
            builder: (context)=> Center(child: Lottie.asset(AppImageAsset.loadingAuth,)),
            fallback: (context)=>Form(
              key: controller.formState,

              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextTitleAuth(text: '10'.tr),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextBodyAuth(
                      text:
                      '24'.tr),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFromAuth(
                    validator: (val)
                    {
                      return validInput(val.toString(), 5, 100, "username");
                    },
                    keyboardType: TextInputType.text,
                    hinText: '23'.tr,
                    labelText: '20'.tr,
                    iconSuffix: const Icon(Icons.person_outline),
                    myController: controller.userNameController!,
                  ),
                  CustomTextFromAuth(
                    validator: (val)
                    {
                      return validInput(val.toString(), 5, 100, "email");
                    },
                    keyboardType: TextInputType.emailAddress,
                    hinText: '12'.tr,
                    labelText: '18'.tr,
                    iconSuffix: const Icon(Icons.email_outlined),
                    myController:controller.emailController! ,
                  ),
                  CustomTextFromAuth(
                    validator: (val)
                    {
                      return validInput(val.toString(), 11, 12, "phone");
                    },
                    keyboardType: TextInputType.phone,
                    hinText: '22'.tr,
                    labelText: '21'.tr,
                    iconSuffix: const Icon(Icons.phone_android_outlined),
                    myController: controller.phoneController!,
                  ),
                  GetBuilder<SingUpControllerImp>(
                    builder: (context) => CustomTextFromAuth(
                      keyboardType: TextInputType.visiblePassword,
                      validator: (val) {
                        return validInput(val.toString(), 5, 30, "password");
                      },
                      showPassword: controller.isShowPassword,
                      hinText: '13'.tr,
                      labelText: '101'.tr,
                      myController: controller.passwordController!,
                      iconSuffix: IconButton(
                        onPressed: () {
                          controller.showPassword();
                        },
                        icon: ConditionalBuilder(
                          condition: controller.isShowPassword == false,
                          builder: (context) => const Icon(Icons.lock_open_outlined),
                          fallback: (context) => const Icon(Icons.lock_outline),
                        ),
                      ),
                    ),
                  ),
                  GetBuilder<SingUpControllerImp>(
                    builder: (context)=>CustomButtonAuth(
                      text: '17'.tr,
                      onPressed: ()
                      {
                        controller.signUp();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextSingUpOrSingIn(
                      textOne: '25'.tr,
                      textTwo: '26'.tr,
                      ontap: (){controller.goToLogin();}),
                ],
              ),
            ),
          ),


        ),

      ),
    );
  }
}
