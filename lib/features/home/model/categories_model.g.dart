// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel()
      ..categorieId = json['categorieId'] as int?
      ..title = json['title'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'categorieId': instance.categorieId,
      'title': instance.title,
      'image': instance.image,
    };
