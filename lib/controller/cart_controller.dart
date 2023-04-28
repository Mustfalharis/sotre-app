import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';
import 'package:store_getx/data/data_source/remote/cart.dart';
import 'package:store_getx/data/model/cart_model.dart';
import 'package:store_getx/data/model/copuon_model.dart';

import '../core/class/status_request.dart';
import '../core/constant/color.dart';
import '../core/functions/handing_data_controller.dart';
import '../core/services/services.dart';
abstract class CartController extends GetxController
{
  add(String itemsId );
  delete(String itemsId );
  getCount(String itemsId );
  getData();
  checkCoupon();
  goToCheckOut();

}
class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest,statusRequestTwo;
  MyServices myServices = Get.find();
  List<CartModel> data=[];
  int totalPriceAllItems=0;
  int countAllItems=0;
  int discountCoupon=0;
  String? nameCoupon;
  String? couponId;
  late TextEditingController? controllerCoupon;
  CouponModel? couponModel;


  @override
  add(String itemsId) async
  {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id").toString(),
        itemsId.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        countAllItems++;
        getData();
        Get.rawSnackbar(
            backgroundColor: AppColor.green,
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج من السلة "));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  delete(String itemsId)async
  {
    statusRequest = StatusRequest.loading;
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id").toString(),
        itemsId.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        countAllItems--;
        getData();
        print("delete");
        Get.rawSnackbar(
            backgroundColor: AppColor.primaryColor,
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من السلة "));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  getCount(String itemsId)async
  {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id").toString(),
        itemsId.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
          return  int.parse(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
  @override
  void onInit() {
    controllerCoupon=TextEditingController();
    reFreshPage();
    super.onInit();
  }
  @override
  getData()async
  {
    data.clear();
    update();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getData(
        myServices.sharedPreferences.getString("id").toString(),);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if(response['countAndPrice']!="0") {
          List temp = response['data'];
          data.addAll(temp.map((e) => CartModel.fromJson(e)));
          totalPriceAllItems =int.parse(response['countAndPrice']['totalPrice']);
          countAllItems = int.parse(response['countAndPrice']['countItmes']);
        }
        else
          {
            reFreshPage();
            statusRequest = StatusRequest.failure;
          }
      }
      update();
    }
  }
  reFreshPage()
  {
    getData();
    restVarCart();
  }
  restVarCart()
  {
    totalPriceAllItems=0;
    totalPriceAllItems=0;
    data.clear();
  }

  @override
  checkCoupon()async
  {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllerCoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success")
      {
        Map<String,dynamic> dataCoupon=response['data'];
        couponModel=CouponModel.fromJson(dataCoupon);
        discountCoupon=int.parse(couponModel!.couponDiscount!);
         nameCoupon=couponModel!.couponName;
        couponId=couponModel!.couponId;

      }
      else
        {
          discountCoupon=0;
          nameCoupon=null;
          couponId=null;
          Get.snackbar('Coupon'.tr, "The coupon is not valid".tr,backgroundColor: Colors.red );
        }
      update();
    }
  }
   int getTotalPricePrice()
  {
   return (totalPriceAllItems-(totalPriceAllItems*discountCoupon/100)).toInt();
  }
  @override
  goToCheckOut() {
    if(data.isEmpty) return Get.snackbar("تنبيه","السلة فارغة");
      Get.toNamed(AppRoute.checkOut, arguments: {
        "couponId": couponId ?? "0",
        "priceOrder": totalPriceAllItems.toString(),
        "discountCoupon":discountCoupon.toString(),
      });
      print(totalPriceAllItems);

  }

  }





