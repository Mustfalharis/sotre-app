


import 'package:flutter/cupertino.dart';
import 'package:store_getx/core/constant/color.dart';
class CustomTextBodyAuth extends StatelessWidget {
  final String text;
  const CustomTextBodyAuth({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child:  Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          color: AppColor.grey,
        ),
      ),
    );
  }
}
