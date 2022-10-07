import 'package:vexana/vexana.dart';
import 'package:yemektariflerim/features/home/model/categories_model.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';

enum _HomeServicePath { foods, categories }

abstract class IHomeService {
  late final INetworkManager _networkManager;

  IHomeService(INetworkManager networkManager)
      : _networkManager = networkManager;

  Future<List<ProductModel>?> fetchAllProducts({int count = 5});
  Future<List<CategoriesModel>?> fetchAllCategories();
}

class HomeService extends IHomeService {
  HomeService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<ProductModel>?> fetchAllProducts({int count = 5}) async {
    final response = await _networkManager
        .send<ProductModel, List<ProductModel>>(_HomeServicePath.foods.name,
            parseModel: ProductModel(), method: RequestType.GET);

    return response.data;
  }

  @override
  Future<List<CategoriesModel>?> fetchAllCategories() async {
    final CategoriesResponse =
        await _networkManager.send<CategoriesModel, List<CategoriesModel>>(
            _HomeServicePath.categories.name,
            parseModel: CategoriesModel(),
            method: RequestType.GET);

    return CategoriesResponse.data;
  }
}
