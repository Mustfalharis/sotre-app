import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/core/class/hindling_data_view.dart';
import 'package:store_getx/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/images_asset.dart';
import 'package:store_getx/view/screen/cart.dart';
import 'package:store_getx/view/widget/checkout/card_delivery_type.dart';
import 'package:store_getx/view/widget/checkout/card_shipping_address.dart';

import '../../controller/checkout_controller.dart';
import '../widget/checkout/card_pay_menthd.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckControllerImp controller = Get.put(CheckControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.primaryColor,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: MaterialButton(
          color: AppColor.secondColor,
          textColor: Colors.white,
          onPressed: () {
            controller.checkout();
          },
          child: Text(
            'CheckOut',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
      body: GetBuilder<CheckControllerImp>(
        builder: (context) => HandlingDataView(
          statusRequest: controller.statusRequest!,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const Text(
                  'Chose Payment Method',
                  style: TextStyle(
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                InkWell(
                    onTap: () {
                      controller.chosePaymentMethods("0"); // cash
                    },
                    child: CardPaymentMethodCheckout(
                      title: "Cash ON Delivery",
                      isActive:
                          controller.paymentMethods == "0" ? true : false,
                    )),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.chosePaymentMethods("1"); // card
                  },
                  child: CardPaymentMethodCheckout(
                    title: "Payment Cards",
                    isActive:
                        controller.paymentMethods == "1" ? true : false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Choose Delivery Type',
                  style: TextStyle(
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.choseDeliveryType("0"); // Delivery
                      },
                      child: CardDeliveryTypeCheckout(
                        imageName: AppImageAsset.delivery,
                        title: "Delivery",
                        active: controller.deliveryType == "0"
                            ? true
                            : false,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        controller.choseDeliveryType("1"); // Revice
                      },
                      child: CardDeliveryTypeCheckout(
                        imageName: AppImageAsset.driveThru,
                        title: "Revice",
                        active:
                            controller.deliveryType == "1" ? true : false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ConditionalBuilder(
                  condition: controller.deliveryType == "1" ||
                      controller.deliveryType == null,
                  builder: (context) => Container(),
                  fallback: (context) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                       Text(
                        'Shipping Address',
                        style: TextStyle(
                            color: AppColor.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                       SizedBox(
                        height: 10,
                      ),
                       CardShippingAddressCheckout(
                        title: 'Home',
                        body: 'Damacus Street One Building 23',
                        isActive: true,
                      ),
                       CardShippingAddressCheckout(
                        title: 'Company',
                        body: 'amacus Street One Building 23',
                        isActive: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
