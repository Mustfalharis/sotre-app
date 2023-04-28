import 'package:flutter/material.dart';
import 'package:store_getx/core/functions/vaild_input.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/images_asset.dart';
import '../../../core/functions/alertexit_app.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_text_from_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/customte_text_body_auth.dart';
import '../../widget/auth/logo_auth.dart';
import '../../widget/auth/text_sing_up.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '9'.tr,
          style: const TextStyle(
              fontSize: 20, color: AppColor.grey, fontWeight: FontWeight.bold),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => ConditionalBuilder(
            condition: controller.statusRequest == StatusRequest.loading,
            builder: (context) => Center(
                child: Lottie.asset(
              AppImageAsset.loadingAuth,
            )),
            fallback: (context) => Form(
              key: controller.formState,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                children: [
                  const LogoAuth(),
                  CustomTextTitleAuth(text: '10'.tr),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextBodyAuth(text: '11'.tr),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFromAuth(
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      return validInput(val.toString(), 5, 100, "emil");
                    },
                    hinText: '12'.tr,
                    labelText: '100'.tr,
                    iconSuffix: const Icon(Icons.email_outlined),
                    myController: controller.emailController!,
                  ),
                  GetBuilder<LoginControllerImp>(
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
                          builder: (context) =>
                              const Icon(Icons.lock_open_outlined),
                          fallback: (context) => const Icon(Icons.lock_outline),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.goToForgetPassword();
                    },
                    child: Text(
                      '14'.tr,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  CustomButtonAuth(
                    text: '15'.tr,
                    onPressed: () {
                      controller.login();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextSingUpOrSingIn(
                    textOne: '16'.tr,
                    textTwo: '17'.tr,
                    ontap: () {
                      controller.goToSingUP();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
