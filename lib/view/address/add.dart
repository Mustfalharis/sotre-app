import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constant/color.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title:  const Text('add new address'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {

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