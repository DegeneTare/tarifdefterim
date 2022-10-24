// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUploadResponse _$ImageUploadResponseFromJson(Map<String, dynamic> json) =>
    ImageUploadResponse()
      ..url = json['url'] as String?
      ..size = json['size'] as int?
      ..type = json['type'] as String?
      ..filename = json['filename'] as String?;

Map<String, dynamic> _$ImageUploadResponseToJson(
        ImageUploadResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
      'size': instance.size,
      'type': instance.type,
      'filename': instance.filename,
    };
