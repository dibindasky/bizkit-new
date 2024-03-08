// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foregott_password_responce_mdel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForegottPasswordResponceMdel _$ForegottPasswordResponceMdelFromJson(
        Map<String, dynamic> json) =>
    ForegottPasswordResponceMdel(
      message: json['message'] as String?,
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$ForegottPasswordResponceMdelToJson(
        ForegottPasswordResponceMdel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'refresh': instance.refresh,
      'access': instance.access,
      'user_id': instance.userId,
    };
