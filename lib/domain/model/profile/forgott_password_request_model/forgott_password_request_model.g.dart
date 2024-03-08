// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgott_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgottPasswordRequestModel _$ForgottPasswordRequestModelFromJson(
        Map<String, dynamic> json) =>
    ForgottPasswordRequestModel(
      oldPassword: json['old_password'] as String?,
      newPassword: json['new_password'] as String?,
    );

Map<String, dynamic> _$ForgottPasswordRequestModelToJson(
        ForgottPasswordRequestModel instance) =>
    <String, dynamic>{
      'old_password': instance.oldPassword,
      'new_password': instance.newPassword,
    };
