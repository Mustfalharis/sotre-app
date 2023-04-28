import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/color.dart';
import 'package:store_getx/core/constant/routes.dart';

import '../core/class/status_request.dart';
import '../core/functions/handing_data_controller.dart';
import '../core/services/services.dart';
import '../data/data_source/remote/check_out.dart';
abstract class CheckController extends GetxController
{
  checkout();
}

class CheckControllerImp extends CheckController {
  late StatusRequest? statusRequest=StatusRequest.success;
  String? paymentMethods;
  String? deliveryType;
  String? addressID;
  late String couponId;
  late String priceOrder;
  late String couponDiscount;
  MyServices myServices = Get.find();
  CheckOutData checkOut = CheckOutData(Get.find());
  chosePaymentMethods(String val)
  {
    paymentMethods=val;
    update();
  }
  choseDeliveryType(String val)
  {
    deliveryType=val;
    update();
  }
  choseShippingAddressID(String val)
  {
    addressID=val;
    update();
  }
  @override
  void onInit() {
    couponId=Get.arguments['couponId'];
    priceOrder=Get.arguments['priceOrder'];
    couponDiscount=Get.arguments['discountCoupon'].toString();
    super.onInit();
  }
  @override
  checkout()async
  {
    if(paymentMethods==null) {
      return Get.snackbar('Error'.tr,"Please Select a payment method");
    }
    if(deliveryType==null) {
      return Get.snackbar('Error'.tr,"Please Select a order Type ");
    }
    statusRequest = StatusRequest.loading;
    update();
    Map data={
      "usersid":myServices.sharedPreferences.getString("id").toString(),
      "addressid":"6",
      "orderstype":deliveryType.toString(),
      "pricedlivery":"10",
      "ordersprice":priceOrder.toString(),
      "conupoind":couponId.toString(),
      "coupondicount":couponDiscount.toString(),
      "paymentmethod":paymentMethods,
    };
    var response = await checkOut.checkOutData(data);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
           Get.offAllNamed(AppRoute.home);
           print("Sussulf");
           Get.snackbar('Success'.tr,"The Order Was SuccessFully",backgroundColor: AppColor.green);
      }
      else {
        statusRequest = StatusRequest.failure;
        Get.snackbar('Error'.tr,"Try again" );
      }

    }
    update();
  }
}