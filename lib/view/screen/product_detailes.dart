import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_getx/controller/product_detailes.dart';
import 'package:store_getx/core/class/hindling_data_view.dart';

import '../../core/constant/color.dart';
import '../../core/functions/translate_dabase.dart';
import '../widget/product_details/priceand_count.dart';
import '../widget/product_details/sub_items_list.dart';
import '../widget/product_details/top_page_product_details.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller=  Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: ()
                {
                  controller.goToCart();
                },
                child: const Text(
                  "GO To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
                children: [
              const TopProductPageDetails(),
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${translateDatabase(
                          controller.itemsModel.itemsNameAr,
                          controller.itemsModel.itemsName)}",
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                                color: AppColor.fourthColor,
                              )),
                      const SizedBox(height: 10),
                      PriceAndCountItems(
                          onAdd: () {

                             controller.add();
                          },
                          onRemove: () {
                            controller.remove();
                          },
                          price: "${controller.itemsModel.itemsPriceAfterDis}",
                          count:'${controller.countItems}'),
                      const SizedBox(height: 10),
                      Text(
                          "${translateDatabase(
                              controller.itemsModel.itemsDescAr,
                              controller.itemsModel.itemsDesc)}",
                          style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(height: 10),
                      Text("65".tr,
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                                color: AppColor.fourthColor,
                              )),
                      const SizedBox(height: 10),
                      const SubitemsList()
                    ]),
              )
            ]),
          ),
        ));
  }
}
