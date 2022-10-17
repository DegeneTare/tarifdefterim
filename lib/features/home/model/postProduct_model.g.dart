// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postProduct_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

postProductModel _$postProductModelFromJson(Map<String, dynamic> json) =>
    postProductModel(
      json['title'] as String?,
      json['name'] as String?,
      json['kacKisilik'] as String?,
      json['hazirlanmaSuresi'] as String?,
      json['pisirmeSuresi'] as String?,
      json['malzemeler'] as String?,
      json['hazirlanisi'] as String?,
      json['kategori'] as String?,
      json['img'] as String?,
      json['favorite'] as int?,
    );

Map<String, dynamic> _$postProductModelToJson(postProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'name': instance.name,
      'kacKisilik': instance.kacKisilik,
      'hazirlanmaSuresi': instance.hazirlanmaSuresi,
      'pisirmeSuresi': instance.pisirmeSuresi,
      'malzemeler': instance.malzemeler,
      'hazirlanisi': instance.hazirlanisi,
      'kategori': instance.kategori,
      'img': instance.img,
      'favorite': instance.favorite,
    };
