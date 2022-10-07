import 'package:flutter/material.dart';
import 'package:yemektariflerim/product/constant/application_constant.dart';
import 'package:yemektariflerim/product/mixin/image_mixin.dart';

class projectNetworkImage extends Image with imageMixin {
  projectNetworkImage.network({Key? key, required String? src})
      : super.network(src ?? applicationConstant.instance.dummyImage);
}

class projeColors {
  final Color transparentColor = Colors.transparent;
  final Color redColor = Colors.redAccent;
  final Color blackColor = Colors.black;
  final Color whiteColor = Colors.white;
  final Color LightWhiteC = Colors.white60;
  final Color blue = Colors.blue;
}
