// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

registerModel _$registerModelFromJson(Map<String, dynamic> json) =>
    registerModel(
      json['name'] as String?,
      json['email'] as String?,
      json['password'] as String?,
    );

Map<String, dynamic> _$registerModelToJson(registerModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
