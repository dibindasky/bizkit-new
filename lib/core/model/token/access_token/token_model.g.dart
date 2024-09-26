// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      accessToken: json['access'] as String?,
      refreshToken: json['refresh'] as String?,
      name: json['name'] as String?,
      uid: json['user_id'] as String?,
      logoutFromDevice: json['logout_form_device'] as String?,
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'access': instance.accessToken,
      'refresh': instance.refreshToken,
      'name': instance.name,
      'user_id': instance.uid,
      'logout_form_device': instance.logoutFromDevice,
    };
