import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';
import 'package:yemektariflerim/features/home/model/categories_model.dart';
import 'package:yemektariflerim/features/home/model/postProduct_model.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/features/home/service/home_service.dart';
import 'package:yemektariflerim/features/home/service/post_service.dart';

void main() {
  late IHomeService homeService;
  late postService PostService;
  setUp(() {
    /*  homeService = HomeService(NetworkManager(
        options: BaseOptions(baseUrl: 'http://192.168.0.16:3000/')));*/
    //ProductModel('asdas','asdas','asda','asdas','asda','asdas','asdasas','asdas',3)

    PostService = postService(NetworkManager(
        options: BaseOptions(baseUrl: 'http://192.168.0.16:3000/')));
  });

  test('fetchAllProducts - test', () {
    final response = PostService.postProduct(postProductModel('asdas', 'asdas',
        'adas', 'asdas', 'asdsa', 'asdasdas', 'adas', 'asdasd', 'asdasd', 4));

    expect(response, isNotNull);
  });
}
