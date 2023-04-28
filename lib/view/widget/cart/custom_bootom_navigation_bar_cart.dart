import 'package:flutter/material.dart';
import 'package:store_getx/controller/cart_controller.dart';
import '../../../core/constant/color.dart';
import 'custom_button_coupon.dart';
import 'custom_cart.dart';
import 'package:get/get.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
class BottomNavigationBarCart extends GetView<CartControllerImp> {
  final String price;
  final String discount;
  final String totalPrice;
  final String shipping;
  final VoidCallback onPressed;
  final TextEditingController controllerCoupon;
  final VoidCallback onApplyCoupon;
  const BottomNavigationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.totalPrice,
      required this.onPressed, required this.controllerCoupon, required this.onApplyCoupon, required this.shipping})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConditionalBuilder(
          condition: controller.nameCoupon== null,
          builder: (context) =>  Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  flex:2,
                  child: TextFormField(
                    controller: controllerCoupon,
                    decoration: const InputDecoration(
                      isDense:true,
                      contentPadding: EdgeInsets.symmetric(vertical:6,horizontal: 10),
                      hintText: "Coupon Code",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),

                ),
                const SizedBox(width: 5,),
                Expanded(
                  flex: 1,
                  child: CustomButtonCoupon(
                      textButton: "apply",
                      onPressed: onApplyCoupon
                  ),
                )
              ],
            ),
          ),
          fallback: (context) => Text(
            "Coupon ${controller.nameCoupon}",
            style: const TextStyle(
                color: AppColor.primaryColor,
                fontSize: 22,
            ),) ,
        ),

        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text("68".tr, style: const TextStyle(fontSize: 16))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$price\$",
                          style: const TextStyle(fontSize: 16)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text("69".tr, style: const TextStyle(fontSize: 16))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                           Text("${discount}\%", style: const TextStyle(fontSize: 16)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                      Text("shopping".tr, style: const TextStyle(fontSize: 16))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                      Text("${shipping}\%", style: const TextStyle(fontSize: 16)))
                ],
              ),
              const Divider(color: AppColor.grey,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("70".tr,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$totalPrice\$",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor)))
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CustomButtonCart(
          textButton: "71".tr,
          onPressed: onPressed,
        )
      ],
    );
  }

}
