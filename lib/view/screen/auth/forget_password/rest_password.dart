import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forget_password/rest_password_controller.dart';
import '../../../../core/class/status_request.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/images_asset.dart';
import '../../../../core/functions/vaild_input.dart';
import '../../../widget/auth/custom_button_auth.dart';
import '../../../widget/auth/custom_text_from_auth.dart';
import '../../../widget/auth/custom_text_title_auth.dart';
import '../../../widget/auth/customte_text_body_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class RestPassword extends StatelessWidget {
  const RestPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RestPasswordControllerImp controller = Get.put(RestPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '42'.tr,
          style: const TextStyle(
              fontSize: 20, color: AppColor.grey, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<RestPasswordControllerImp>(
        builder: (controller) => ConditionalBuilder(
          condition: controller.statusRequest == StatusRequest.loading,
          builder: (context) => Center(
              child: Lottie.asset(
            AppImageAsset.loadingAuth,
          )),
          fallback: (context) => Form(
            key: controller.formState,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              children: [
                // const LogoAuth(),
                const SizedBox(height: 20),
                CustomTextTitleAuth(text: "35".tr),
                const SizedBox(height: 10),
                CustomTextBodyAuth(text: "35".tr),
                CustomTextBodyAuth(text: '29'.tr),
                const SizedBox(
                  height: 40,
                ),
                GetBuilder<RestPasswordControllerImp>(
                  builder: (context) => CustomTextFromAuth(
                    keyboardType: TextInputType.visiblePassword,
                    validator: (val) {
                      return validInput(val.toString(), 5, 30, "password");
                    },
                    showPassword: controller.isShowPassword,
                    hinText: '13'.tr,
                    labelText: '101'.tr,
                    myController: controller.passwordController,
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
                GetBuilder<RestPasswordControllerImp>(
                  builder: (context) => CustomTextFromAuth(
                    keyboardType: TextInputType.visiblePassword,
                    validator: (val) {
                      return validInput(val.toString(), 5, 30, "password");
                    },
                    showPassword: controller.isShowPassword,
                    hinText: '13'.tr,
                    labelText: '101'.tr,
                    myController: controller.rePasswordController,
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
                CustomButtonAuth(
                  text: '33'.tr,
                  onPressed: () {
                    controller.goToSuccessResetPassword();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
