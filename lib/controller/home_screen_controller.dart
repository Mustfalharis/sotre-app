
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store_getx/view/screen/home.dart';
import 'package:store_getx/view/screen/my_favroite.dart';

import '../view/screen/settings.dart';


abstract class HomeScreenController extends GetxController
{
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage=0;
  List<Widget> listPage=[
     HomePage(),
    const MyFavorite(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Center(child: Text('profuel')),
      ],
    ),
    const Settings(),
  ];
  List bottomAppBar = [
    {"title": "home", "icon": Icons.home},
    {"title": "n", "icon": Icons.notifications_active_outlined},
    {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  changePage(int index)
  {
     currentPage=index;
     update();
  }

}
