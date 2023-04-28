import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_getx/controller/itmes_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translate_dabase.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

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
class Categories extends GetView<ItemsControllerImp>{
  final int? index;
  const Categories({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
         controller.changeCat(index!);
        },
        child: Column(
          children: [
            GetBuilder<ItemsControllerImp>(
              builder: (controller)=>Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration:controller.selectedCat==index?
                const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 4,
                        color: AppColor.primaryColor),
                  )
                ):
                null,
                child: Text(
                  "${translateDatabase(
                      controller.categories[index!].categoriesNamaAr,
                      controller.categories[index!].categoriesName)}",
                  style: const TextStyle(fontSize: 20, color: AppColor.grey2),
                ),
              ),
            )
          ],
        ),
    );
  }
}
