import 'package:vexana/vexana.dart';

import 'package:json_annotation/json_annotation.dart';
part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel extends INetworkModel<CategoriesModel> {
  int? categorieId;
  String? title;
  String? image;

  @override
  CategoriesModel fromJson(Map<String, dynamic> json) {
    return _$CategoriesModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CategoriesModelToJson(this);
  }
}
