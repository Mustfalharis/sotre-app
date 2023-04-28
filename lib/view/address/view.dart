import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_getx/core/constant/routes.dart';

import '../../core/constant/color.dart';
import 'package:get/get.dart';
class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title:  const Text('address'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
            Get.toNamed(AppRoute.addressAdd);
        },
        backgroundColor: AppColor.primaryColor,

        child: const Icon(Icons.add),

      ),
      body: Container(
        child: ListView(
          children:
          [

          ],
        ),
      ),
    );
  }
}