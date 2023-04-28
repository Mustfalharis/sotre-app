import 'package:flutter/material.dart';
import 'package:store_getx/core/class/hindling_data_view.dart';
import 'package:store_getx/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';
import '../../../controller/orders/pending_controller.dart';
class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Get.put(OrderPendingControllerImp());
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:const Text(
            "Orders",
          style: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()
          {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back,color:AppColor.primaryColor,size: 22,),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all( 10),
        child:  GetBuilder<OrderPendingControllerImp>(
            builder:(controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
               itemBuilder: (context, index) => CardOrdersList(index: index),
              ),
            ),
          ),
        ),
        );
  }
}

class CardOrdersList extends GetView<OrderPendingControllerImp> {
  final int index;

  const CardOrdersList({Key? key,required this.index }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Container(
        padding: const EdgeInsets.all( 10),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
             Text(
              "Order Number :${controller.data[index].ordersId}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Text("Order Type : ${controller.printTypeOrder(controller.data[index].ordersType!)}"),
            Text("Order price : ${controller.data[index].orderPrice}\$"),
            Text("Delivery price : ${controller.data[index].ordersPricedelivery}\$"),
            Text("Payment Method : ${controller.printPaymentMethod(controller.data[index].ordersPaymentmethod!)}"),
            Text("Order status: ${controller.printOrderStatus(controller.data[index].ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price: ${controller.data[index].ordersTotalprice}\$",
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                MaterialButton(onPressed: ()
                {
                  controller.goToOrdersDetails(controller.data[index].ordersId!);
                  },
                  color: AppColor.thirdColor,
                  child: const Text(
                    "Details",
                  ),
                ),

              ],
            ),


          ],
        ),
      ),
    );
  }
}

