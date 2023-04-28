
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';
import '../core/class/status_request.dart';
import '../core/functions/handing_data_controller.dart';
import '../core/services/services.dart';
import '../data/data_source/remote/cart.dart';
import '../data/model/itmes_model.dart';
abstract class ProductDetailsController extends GetxController
{
  intialData();
  getCountItems(String itemsid);
  addItems(String itemsid);
  deleteitems(String itemsid);
  add();
  remove();
  goToCart();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  int countItems = 0;

  @override
  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['ItemsModel'];
    countItems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("==================================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  @override
  addItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  deleteitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  List subItems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  add() {
    addItems(itemsModel.itemsId!);
    countItems++;
    update();
  }

  @override
  remove() {
    if (countItems > 0) {
      deleteitems(itemsModel.itemsId!);
      countItems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cart);
  }
}