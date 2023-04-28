
import 'package:flutter/material.dart';
import '../../controller/home_controller.dart';
import '../../core/constant/color.dart';
import '../../core/functions/translate_dabase.dart';
import '../../data/model/itmes_model.dart';
import '../../link_api.dart';
import 'package:get/get.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class ListItemsSearch extends GetView<HomeControllerImp>{
  final List<ItemsModel> listData;
  const ListItemsSearch({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       shrinkWrap: true,
        itemCount: listData.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listData[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                  child: Container(
                    padding: const  EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ConditionalBuilder(
                          condition: listData[index].itemsDiscount!="0",
                          builder: (context) =>  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColor.primaryColor,
                                child: Text('${listData[index].itemsDiscount}\%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ),
                            ],
                          ),
                          fallback: (context) => const SizedBox(),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Image.network(
                             "${AppLink.imageCategories}/${listData[index].itemsImage}")),
                            Expanded(
                                flex: 2,
                                child: ListTile(
                                  title: Text("${translateDatabase(
                                      listData[index].itemsNameAr,
                                      listData[index].itemsName)}",),
                                  subtitle: Text("${translateDatabase(
                                      listData[index].categoriesNameAr,
                                      listData[index].categoriesName)}"),
                                ))
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          );
    });
  }
}
