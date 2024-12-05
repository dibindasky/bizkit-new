// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Access _$AccessFromJson(Map<String, dynamic> json) => Access(
      id: json['_id'] as String?,
      access: json['access'] as String?,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      comesUnder: json['comes_under'] as String?,
    );

Map<String, dynamic> _$AccessToJson(Access instance) => <String, dynamic>{
      '_id': instance.id,
      'access': instance.access,
      'permissions': instance.permissions,
      'comes_under': instance.comesUnder,
    };
