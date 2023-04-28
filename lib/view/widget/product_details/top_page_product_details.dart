import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/product_detailes.dart';
import '../../../core/constant/color.dart';
import '../../../link_api.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(color: AppColor.secondColor),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${0}",
              child:Image.network( "${AppLink.imageCategories}/${controller.itemsModel.itemsImage}",
                height: 250,
                fit: BoxFit.fill,),
            ))
      ],
    );
  }
}