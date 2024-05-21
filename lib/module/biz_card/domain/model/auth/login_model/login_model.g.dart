// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      deviceId: json['device_id'] as String?,
      deviceToken: json['device_token'] as String?,
      deviceType: json['device_type'] as int?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'device_type': instance.deviceType,
      'device_id': instance.deviceId,
      'device_token': instance.deviceToken,
    };
