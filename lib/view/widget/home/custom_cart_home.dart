
import 'package:flutter/material.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import 'package:get/get.dart';
class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;

  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 15, vertical: 15),
      child: Stack(
          children:
          [
        Container (
          alignment: Alignment.center,
          child:  ListTile(
            title: Text(title,
                style:const TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Text(body,
                style: const TextStyle(color: Colors.white, fontSize: 30)),
          ),
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
          top: -20,
          right: controller.lang=="en"?-20:null,
          left: controller.lang=="ar"?-20:null,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(160)),
          ),
        )
      ]),
    );
  }
}
