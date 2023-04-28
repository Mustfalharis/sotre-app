


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomTextFromAuth extends StatelessWidget {
  final String hinText;
  final String labelText;
  final Widget iconSuffix;
  final TextEditingController myController;
  final  FormFieldValidator<String>? validator;
    TextInputType? keyboardType;
  bool showPassword=false;
  CustomTextFromAuth({Key? key,
    required this.hinText,
    required this.labelText,
    required this.iconSuffix,
    required this.myController,
      this.keyboardType,
     this.validator,
    this.showPassword=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: keyboardType,
       obscureText: showPassword,
        validator: validator,
      controller: myController,
      decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
      label: Container(
      margin: const EdgeInsets.symmetric(horizontal: 9) ,
      child:  Text(labelText)
      ),
      prefixIcon:  iconSuffix,
      hintText: hinText,
      hintStyle: const TextStyle(
      fontSize: 14,
      ),
      border:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      ),
      ),
      ),
    );
  }
}
