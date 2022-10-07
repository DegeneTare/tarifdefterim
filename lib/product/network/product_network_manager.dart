import 'package:vexana/vexana.dart';
import 'package:yemektariflerim/product/constant/application_constant.dart';

class productNetworkManager extends NetworkManager {
  productNetworkManager()
      : super(
            options:
                BaseOptions(baseUrl: applicationConstant.instance.baseUrl));
}
