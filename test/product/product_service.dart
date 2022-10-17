import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';
import 'package:yemektariflerim/features/home/service/home_service.dart';

void main() {
  late IHomeService homeService;
  setUp(() {
    homeService = HomeService(NetworkManager(
        options: BaseOptions(baseUrl: 'http://192.168.0.16:3000/')));
  });

  test('fetchAllProducts - test', () async {
    final response = await homeService.fetchAllProductsWithSort();

    expect(response, isNotEmpty);
  });
}
