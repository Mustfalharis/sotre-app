import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/controller/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/color.dart';
import 'package:store_getx/core/constant/routes.dart';
import '../widget/home/custom_buttom_abbparHome.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder:(controller)=>Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: ()
            {
              Get.toNamed(AppRoute.cart);
            },
            backgroundColor: AppColor.primaryColor,
            child: const Icon(Icons.shopping_basket_outlined),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:const CustomBottomAppBarHomeScreen(),
          body: controller.listPage.elementAt(controller.currentPage),
        ),
    );
  }
}
