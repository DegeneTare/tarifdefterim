import 'package:flutter/material.dart';
import 'package:yemektariflerim/product/utility/project_network_image.dart';
import 'package:yemektariflerim/product/utility/project_utilitys.dart';

class textfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labeltext;
  final IconData? icon;
  final bool IsObscure;
  final TextInputType? inputType;

  const textfieldWidget({
    Key? key,
    required this.controller,
    required this.labeltext,
    this.icon,
    this.IsObscure = false,
    this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: projeColors().blackColor),
      obscureText: IsObscure,
      keyboardType: inputType,
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: labeltext,
          prefixIcon: Icon(icon, color: Colors.black),
          hintStyle: const TextStyle(fontSize: 15, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          )),
    );
  }
}
