

import 'package:flutter/material.dart';
import 'package:store_getx/core/constant/routes.dart';
import '../../core/localization/changelocal.dart';
import '../widget/language/custom_buttom_language.dart';
import 'package:get/get.dart';
class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("1".tr, style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 20),
            CustomButtonLanguage(
                textButton: 'ar',
                onPressed: ()
                {
                controller.changeLang("ar");
                Get.offNamed(AppRoute.onBoarding);
                },
            ),
            CustomButtonLanguage(
              textButton: 'en',
              onPressed: ()
              {
                controller.changeLang("en");
                Get.offNamed(AppRoute.onBoarding);
              },
            ),

          ],
        ),
      ),
    );
  }
}
