
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:store_getx/controller/itmes_controller.dart';
import 'package:store_getx/core/class/hindling_data_view.dart';
import '../../controller/favorites_controller.dart';
import '../../data/model/itmes_model.dart';
import '../widget/custom_appbar.dart';
import '../widget/itmes/custom_list_items.dart';
import '../widget/itmes/list_categoires_items.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../widget/list_items_search.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFa=  Get.put(FavoriteController());
    return Container(
      child: Scaffold(
        body:GetBuilder<ItemsControllerImp>(
          builder: (controller)=> ListView(
                children:
                [
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
                      controller.checkSearch(value,controller.selectedCat.toString());
                      print(controller.isSearch);
                    },
                    myController: controller.search!,
                    titleAppbar: '59'.tr,
                  ),
                  const SizedBox(height: 15,),
                   const ListCategoriesItems(),
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget:ConditionalBuilder(
                      condition: controller.isSearch==false,
                      builder: (context) =>  Column(
                          children: [
                            GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:controller.data.length,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.7),
                                itemBuilder: (BuildContext context, index) {
                                  controllerFa.isFavorite[controller.data[index]
                                  ['items_id']] = controller.data[index]['favorite'];
                                  return CustomListItems(
                                      itemsModel: ItemsModel.fromJson(controller.data[index])
                                  );
                                }),
                          ]),
                      fallback: (context) => ListItemsSearch(listData: controller.itemsSearch),
                    ),
                  ),
                  ]),

          ),
        )
        );
  }
}
