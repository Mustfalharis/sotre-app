import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forget_password/forget_password_controller.dart';
import '../../../../core/class/status_request.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/images_asset.dart';
import '../../../../core/functions/vaild_input.dart';
import '../../../widget/auth/custom_button_auth.dart';
import '../../../widget/auth/custom_text_from_auth.dart';
import '../../../widget/auth/custom_text_title_auth.dart';
import '../../../widget/auth/customte_text_body_auth.dart';
import '../../../widget/auth/logo_auth.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:lottie/lottie.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '14'.tr,
          style: const TextStyle(
              fontSize: 20, color: AppColor.grey, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
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
                CustomTextTitleAuth(text: "27".tr),
                const SizedBox(height: 10),
                CustomTextBodyAuth(text: '29'.tr),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFromAuth(
                  validator: (val) {
                    return validInput(val.toString(), 5, 100, "email");
                  },
                  keyboardType: TextInputType.emailAddress,
                  hinText: '12'.tr,
                  labelText: '100'.tr,
                  iconSuffix: const Icon(Icons.email_outlined),
                  myController: controller.emailController!,
                ),
                CustomButtonAuth(
                  text: '30'.tr,
                  onPressed: () {
                    controller.goToVerifyCode();
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
