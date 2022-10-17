import 'package:vexana/vexana.dart';
import 'package:yemektariflerim/features/home/model/postProduct_model.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';

class postService {
  final INetworkManager networkManager;
  postService(this.networkManager);

  Future<IResponseModel<ProductModel?>?> postProduct(
      postProductModel model) async {
    return await networkManager.send<ProductModel, ProductModel>('foods',
        data: model, parseModel: ProductModel(), method: RequestType.POST);
  }
}
