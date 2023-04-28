
import 'package:flutter/material.dart';
import 'package:store_getx/core/class/hindling_data_view.dart';
import '../../controller/cart_controller.dart';
import '../../core/functions/translate_dabase.dart';
import '../widget/cart/app_bar_cart.dart';

import '../widget/cart/costom_items_list.dart';
import '../widget/cart/custom_bootom_navigation_bar_cart.dart';
import '../widget/cart/top_card_cart.dart';
import 'package:get/get.dart';
class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CartControllerImp controller=  Get.put(CartControllerImp());
    return Scaffold(
            bottomNavigationBar: GetBuilder<CartControllerImp>(
              builder: (controller)=>BottomNavigationBarCart(
                totalPrice: controller.getTotalPricePrice().toString(),
                discount: controller.discountCoupon.toString(),
                shipping: "0",
                price: "${controller.totalPriceAllItems}",
                controllerCoupon:controller.controllerCoupon!,
                 onPressed: ()
                 {
                   controller.goToCheckOut();
                 },
                onApplyCoupon: ()
                {
                  controller.checkCoupon();
                },
            ),
            ),
            body: GetBuilder<CartControllerImp>(
              builder: (controller)=> HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
              padding: const  EdgeInsets.only(top: 30),
              children:
              [
                 TopAppBarCart(title: '66'.tr),
                const SizedBox(height: 10,),
                 TopCardCart(title:"67".tr,titleTwo: "${controller.countAllItems}"),
                Container(
                  padding:const EdgeInsets.all(10),
                  child: Column(
                    children:  [
                      ...List.generate(controller.data.length, (index) =>CustomItemsCartList(
                            image:controller.data[index].itemsImage!,
                            itemsId: controller.data[index].itemsId!,
                            name: translateDatabase(
                                controller.data[index].itemsNameAr,
                                controller.data[index].itemsName)!,
                            count: controller.data[index].countItemsTotil!,
                            price: controller.data[index].itemsPriceTotil!,
                          ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
