
import 'package:flutter/material.dart';
import 'package:store_getx/data/model/itmes_model.dart';
import '../../../controller/favorites_controller.dart';
import '../../../controller/itmes_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translate_dabase.dart';
import '../../../link_api.dart';
import 'package:get/get.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({required this.itemsModel}) ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToProductDetails(itemsModel);
      },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConditionalBuilder(
                    condition: itemsModel.itemsDiscount!="0",
                    builder: (context) =>  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColor.primaryColor,
                          child: Text('${itemsModel.itemsDiscount}\%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                      ],
                    ),
                    fallback: (context) => const SizedBox(),
                  ),

                  Image.network(
                    '${AppLink.imageCategories}/${itemsModel.itemsImage}',
                    height: 100,
                    fit: BoxFit.fill,),
                 const  SizedBox(height: 10) ,
                  Text(
                      "${translateDatabase(
                          itemsModel.itemsNameAr,
                          itemsModel.itemsName)}",
                      style: const  TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     const  Text("Rating 3.5 ", textAlign: TextAlign.center),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 22,
                        child: Row(
                          children: [
                            ...List.generate(
                                5, (index) => const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConditionalBuilder(
                        condition: itemsModel.itemsDiscount!="0",
                        builder: (context) =>   Row(
                          children:
                          [
                            Text("${itemsModel.itemsPrice}\$",
                                style: const TextStyle(
                                    color: AppColor.grey,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 16,
                                    fontFamily: "sans")),
                            const SizedBox(width: 18,),
                            Text("${(itemsModel.itemsPriceAfterDis)}\$",
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sans")),
                          ],
                        ),
                        fallback: (context) => Text("${(itemsModel.itemsPriceAfterDis)}\$",
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sans")),
                      ),

                      GetBuilder<FavoriteController>(
                          builder: (controllerFa) => IconButton(
                              onPressed: () {
                                if (controllerFa.isFavorite[itemsModel.itemsId] ==
                                    "1") {
                                  controllerFa.setFavorite(
                                      itemsModel.itemsId, "0");
                                      controllerFa.removeFavorite(itemsModel.itemsId.toString());
                                } else {
                                  controllerFa.setFavorite(
                                      itemsModel.itemsId, "1");
                                   print(itemsModel.itemsId.toString());
                                  controllerFa.addFavorite(itemsModel.itemsId.toString());
                                }
                              },
                              icon: Icon(
                                controllerFa.isFavorite[itemsModel.itemsId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                              )))
                    ],
                  )
                ]),
          ),
        ));
  }
}