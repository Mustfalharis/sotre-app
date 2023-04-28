
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import 'package:get/get.dart';
class TopAppBarCart extends StatelessWidget {
  final String title;
  const TopAppBarCart({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
             IconButton(
              onPressed: ()
              {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
         const  SizedBox(width: 80,),
               Text(
              title,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.grey
              ),
            ),

          Spacer(),
        ],
      ),
    );
  }
}
