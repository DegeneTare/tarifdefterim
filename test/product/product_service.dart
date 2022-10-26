import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vexana/vexana.dart';
import 'package:yemektariflerim/features/home/model/categories_model.dart';
import 'package:yemektariflerim/features/home/model/postProduct_model.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/features/home/service/home_service.dart';
import 'package:yemektariflerim/features/home/service/post_service.dart';

void main() {
  late IHomeService homeService;
  late postService PostService;
  File? image;

  setUp(() {
    homeService = HomeService(NetworkManager(
        options: BaseOptions(baseUrl: 'http://192.168.0.16:3000/')));
  });

  test('fetchAllProducts - test', () async {
    //final response = await homeService.fetchSelectedProducts('/Tatlı');

    // expect(response, isNotNull);
  });
}
