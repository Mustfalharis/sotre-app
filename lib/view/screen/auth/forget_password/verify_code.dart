import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../controller/auth/forget_password/verify_code_controller.dart';
import '../../../../core/class/status_request.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/images_asset.dart';
import '../../../widget/auth/custom_text_title_auth.dart';
import '../../../widget/auth/customte_text_body_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '39'.tr,
          style: const TextStyle(
              fontSize: 20, color: AppColor.grey, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(
        builder: (controller) => ConditionalBuilder(
          condition: controller.statusRequest == StatusRequest.loading,
          builder: (context) => Center(
              child: Lottie.asset(
            AppImageAsset.loadingAuth,
          )),
          fallback: (context) => ListView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            children: [
              // const LogoAuth(),
              const SizedBox(height: 20),
              CustomTextTitleAuth(text: "40".tr),
              const SizedBox(height: 10),
              CustomTextBodyAuth(text: "41".tr),
              CustomTextBodyAuth(text: controller.email!),
              const SizedBox(height: 15),
              OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String goToRestPassword) {
                  controller.checkCode(goToRestPassword);
                }, // end onSubmit
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
