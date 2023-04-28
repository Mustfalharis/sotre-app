
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/color.dart';
import '../../../controller/home_controller.dart';
import '../../../core/functions/translate_dabase.dart';
import '../../../link_api.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 140,
        child: ListView.builder(
            itemCount: controller.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ItemsHome(
              index: index,
              );
            }),
      ),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final int? index;
  const ItemsHome({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${AppLink.imageCategories}/${controller.items[index!].itemsImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          height: 120,
          width: 200,
        ),
        Positioned(
            left: 10,
            child: Text(
              "${translateDatabase(
                  controller.items[index!].categoriesNameAr,
                  controller.items[index!].categoriesName)}",
              style: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 14),
            ))
      ],
    );
  }
}