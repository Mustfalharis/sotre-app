

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLanguage extends StatelessWidget {
  const CustomButtonLanguage({Key? key,  required this.textButton, required this.onPressed}) : super(key: key);
  final String textButton;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textButton,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
