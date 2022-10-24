import 'package:vexana/vexana.dart';
import 'package:yemektariflerim/core/constant/application_constant.dart';

class productNetworkManager extends NetworkManager {
  productNetworkManager()
      : super(
            options:
                BaseOptions(baseUrl: applicationConstant.instance.baseUrl));
}

class imageNetworkManager extends NetworkManager {
  imageNetworkManager()
      : super(
            options:
                BaseOptions(baseUrl: applicationConstant.instance.imageUrl));
}
