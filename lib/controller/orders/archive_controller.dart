import 'package:get/get.dart';
import 'package:store_getx/core/services/services.dart';
import 'package:store_getx/data/data_source/remote/orders/pending.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handing_data_controller.dart';
import '../../data/data_source/remote/orders/archive.dart';
import '../../data/model/orders_model.dart';
abstract class OrderArchiveController extends GetxController
{
  getOrdersArchiver();
  printTypeOrder(String  val);
  printPaymentMethod(String  val);
  printOrderStatus(String  val);
  goToOrdersDetails(String orderId );
}

class OrderArchiveControllerImp extends OrderArchiveController {
  MyServices myServices=Get.find();
  late StatusRequest statusRequest;
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());
  List<OrdersModel> data=[];
  @override
  getOrdersArchiver()async
  {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.getData(
      myServices.sharedPreferences.getString("id").toString(),);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List temp = response['data'];
        data.addAll(temp.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
  @override
  void onInit() {
    getOrdersArchiver();
    super.onInit();
  }

  @override
  String printTypeOrder(String  val) {
    if(val=="0") {
      return "Delivery";
    }
    else
    {
      return "Recive";
    }
  }

  @override
  printPaymentMethod(String val)
  {
    if(val=="0") {
      return "Cash";
    }
    else
    {
      return "Card";
    }
  }

  @override
  printOrderStatus(String val)
  {
    if(val=="0") {
      return "Pending Approval";
    }
    else if(val=="1")
    {
      return "The Order is being Prepared";
    }
    else if(val=="2")
    {
      return "On the May";
    }
    else {
      return "Archive";
    }
  }

  @override
  goToOrdersDetails(String orderId ) {
    Get.toNamed(AppRoute.ordersDetails,arguments:{
      "ordersId":orderId,
    }
    );
  }





}