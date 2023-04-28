import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/controller/my_favorite_controller.dart';

import '../../core/class/hindling_data_view.dart';
import '../widget/custom_appbar.dart';
import 'package:get/get.dart';

import '../widget/my_favroite/custom_list_favorite_items.dart';
class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteControllerImp>(
            builder: ((controller) => ListView(children: [
              // CustomAppBar(
              //   onPressedFavorite: () {},
              //   onPressedSearch: () {},
              //   titleAppbar: '59'.tr,
              //   onChanged: (value){},
              // ),
              const SizedBox(height: 20) ,
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.data.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return  CustomListFavoriteItems(itemsModel: controller.data[index]) ;
                    },
                  ))
            ]))),
      ),
    );
  }
}
