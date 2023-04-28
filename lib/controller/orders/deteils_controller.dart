
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';
import 'package:store_getx/core/services/services.dart';
import 'package:store_getx/data/model/itmes_model.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handing_data_controller.dart';
import '../../data/data_source/remote/orders/deteils_order.dart';
abstract class OrderDetailsController extends GetxController
{
   getDetails();
}

class OrderDetailsControllerImp extends OrderDetailsController {
  late StatusRequest? statusRequest;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  List<ItemsModel> data=[];
  String? ordersId;
  @override
  getDetails()async
  {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersDetailsData.getData(ordersId!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List temp = response['data'];
        data.addAll(temp.map((e) => ItemsModel.fromJson(e)));
        print(data[0].itemsImage);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
  @override
  void onInit() async {
     ordersId =await Get.arguments['ordersId'];
    getDetails();
    super.onInit();
  }






}