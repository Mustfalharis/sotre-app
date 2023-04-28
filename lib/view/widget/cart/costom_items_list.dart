import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/controller/cart_controller.dart';
import 'package:store_getx/core/class/hindling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../link_api.dart';
import 'package:get/get.dart';

class CustomItemsCartList extends GetView<CartControllerImp> {
  // final ItemsModel itemsModel;
  final String name;
  final String image;
  final String price;
  final String count;
  final String itemsId;
  const CustomItemsCartList(
      {Key? key,
      required this.name,
      required this.price,
      required this.count,
      required this.image,
      required this.itemsId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                child: Image.network(
                  '${AppLink.imageCategories}/${image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name),
                subtitle: Text(
                  "${price}\$",
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 36,
                    child: IconButton(
                      onPressed: () {
                        controller.add(itemsId);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                        height: 30,
                        child: Text(
                          count,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 25,
                    child: IconButton(
                      onPressed: () {
                        controller.delete(itemsId);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
