import 'package:flutter/material.dart';
import 'package:yemektariflerim/core/constant/application_constant.dart';
import 'package:yemektariflerim/product/mixin/image_mixin.dart';

class projectNetworkImage extends Image with imageMixin {
  projectNetworkImage.network({Key? key, required String? src})
      : super.network(src ?? applicationConstant.instance.dummyImage);
}
