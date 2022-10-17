import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'postProduct_model.g.dart';

@JsonSerializable()
class postProductModel extends INetworkModel<postProductModel> {
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

  postProductModel(
      this.title,
      this.name,
      this.kacKisilik,
      this.hazirlanmaSuresi,
      this.pisirmeSuresi,
      this.malzemeler,
      this.hazirlanisi,
      this.kategori,
      this.img,
      this.favorite);

  @override
  postProductModel fromJson(Map<String, dynamic> json) {
    return _$postProductModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$postProductModelToJson(this);
  }
}
