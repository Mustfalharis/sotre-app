
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translate_dabase.dart';
import '../../../link_api.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Categories(
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final int? index;
  const Categories({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        controller.goToItems(controller.categories,index!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: Image.network(
                "${AppLink.imageCategories}/${controller.categories[index!].categoriesImage}",
            ),
          ),
          Text(
            "${translateDatabase(
                controller.categories[index!].categoriesNamaAr,
                controller.categories[index!].categoriesName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}