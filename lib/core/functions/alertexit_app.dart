import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/color.dart';
Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "49".tr,
      titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
      middleText: "50".tr,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              exit(0);
            },
            child:Text("51".tr)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child:Text("52".tr))
      ]);
  return Future.value(true);
}