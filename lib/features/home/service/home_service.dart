import 'package:vexana/vexana.dart';
import 'package:yemektariflerim/features/home/model/categories_model.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/product/query/product_queries.dart';

enum _HomeServicePath {
  foods,
  categories,
}

abstract class IHomeService {
  late final INetworkManager _networkManager;

  IHomeService(INetworkManager networkManager)
      : _networkManager = networkManager;

  Future<List<ProductModel>?> fetchAllProducts();
  Future<List<CategoriesModel>?> fetchAllCategories();
  Future<List<ProductModel>?> fetchAllProductsWithSort();
}

class HomeService extends IHomeService {
  HomeService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<ProductModel>?> fetchAllProductsWithSort() async {
    final response = await _networkManager
        .send<ProductModel, List<ProductModel>>("foods?_sort=favorite&",
            parseModel: ProductModel(),
            method: RequestType.GET,
            queryParameters: Map.fromEntries([
              foodsQueries.Sort.toMapEntry('desc'),
            ]));

    return response.data;
  }

  @override
  Future<List<ProductModel>?> fetchAllProducts() async {
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
