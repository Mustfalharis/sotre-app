import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../core/class/hindling_data_view.dart';
import '../widget/home/custom_Title_home.dart';
import '../widget/custom_appbar.dart';
import '../widget/home/custom_cart_home.dart';
import '../widget/home/list_categorise.dart';
import '../widget/home/list_item_home.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../widget/list_items_search.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => ListView(
            children: [
              CustomAppBar(
                onPressedFavorite: ()
                {
                 controller.goToMyFavorite();
                },
                onPressedSearch: ()
                {
                   controller.onSearchItems();
                   controller.searchData();

                },
                onChanged: (value)
                {
                  controller.checkSearch(value);
                  print(controller.isSearch);
                },
                myController: controller.search!,
                titleAppbar: '59'.tr,
              ),
               HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:ConditionalBuilder(
                condition: controller.isSearch==false,
                builder: (context) =>  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    CustomCardHome(
                      title: '62'.tr,
                      body: '63'.tr,
                    ),
                    CustomTitleHome(
                      title: '60'.tr,
                    ),
                    const ListCategoriesHome(),
                    CustomTitleHome(title: '61'.tr,),
                    const ListItemsHome(),
                  ],
                ),
                fallback: (context) => ListItemsSearch(listData: controller.itemsSearch),
              ),
               ),
            ],
          ));

  }
}

