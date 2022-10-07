import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends INetworkModel<ProductModel> {
  int? id;
  String? title;
  String? name;
  String? kacKisilik;
  String? hazirlanmaSuresi;
  String? pisirmeSuresi;
  String? malzemeler;
  String? hazirlanisi;
  String? kategori;
  String? img;
  int? favorite;
  @override
  ProductModel fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }

  @override
  String toString() {
    return ' $name, $kategori)';
  }
}
