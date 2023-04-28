
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controller/orders/deteils_controller.dart';
import '../../../core/constant/color.dart';
import 'package:get/get.dart';
import '../../../link_api.dart';
class OrdersDetails extends StatelessWidget {
  const OrdersDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OrderDetailsControllerImp controller= Get.put(OrderDetailsControllerImp());
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:const Text(
          "Orders Details",
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
        padding: const EdgeInsets.all(10),
        child: ListView(
          children:
          [
            GetBuilder<OrderDetailsControllerImp>(
              builder: (controller) => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.data.length,
                physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListCard(index:  index),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListCard extends GetView<OrderDetailsControllerImp> {
  final int index;
  const ListCard({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  "${AppLink.imageCategories}/${controller.data[index].itemsImage}",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(width: 20,),
                 Expanded(
                   flex: 4,
                   child: Text(controller.data[index].itemsName,style: const TextStyle(
                    fontSize: 15,
                ),),
                 ),
                const SizedBox(width: 70,),
                 Expanded(
                   flex: 2,
                   child: Text('${controller.data[index].itemsPriceAfterDis}\$',style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColor.primaryColor,
                ),),
                 ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

