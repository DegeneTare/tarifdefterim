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
        options: BaseOptions(
            baseUrl:
                'https://www.filestackapi.com/api/store/S3?key=A2yTjtpmqSxmWyLwILcOEz')));
    //ProductModel('asdas','asdas','asda','asdas','asda','asdas','asdasas','asdas',3)

    PostService = postService(NetworkManager(
        options: BaseOptions(
            baseUrl:
                'https://www.filestackapi.com/api/store/S3?key=A2yTjtpmqSxmWyLwILcOEz')));
  });

  test('fetchAllProducts - test', () {
    final response = homeService.postImages(image);

    expect(response, isNotNull);
  });
}
