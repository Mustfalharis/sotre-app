
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/controller/on_boarding_controller.dart';
import '../widget/on_boarding/custom_button.dart';
import '../widget/on_boarding/custom_dotcontroller.dart';
import '../widget/on_boarding/custom_silder.dart';
import 'package:get/get.dart';
class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:  [
             const Expanded(
               flex: 3,
                 child: CustomSliderOnBoarding()
             ),
            Expanded(
              flex: 1,
                child: Column(
                  children: const
                  [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2,),
                    CustomButtonOnBoarding(),
                    Spacer(flex: 1,),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
