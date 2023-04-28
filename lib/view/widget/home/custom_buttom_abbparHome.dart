

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/controller/home_screen_controller.dart';
import 'package:get/get.dart';
import 'cutom_buttom_appbar.dart';
class CustomBottomAppBarHomeScreen extends  StatelessWidget{
  const CustomBottomAppBarHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller)=>BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children:
          [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 1
                  ? const Spacer()
                  : CustomButtonAppBar(
                onPressed: ()
                {
                  controller.changePage(i);
                },
                textButton:controller.bottomAppBar[i]['title'],
                iconData: controller.bottomAppBar[i]['icon'],
                active: controller.currentPage == i ? true : false,
              );}),
          ],
        ),
      ),
    );
  }
}
