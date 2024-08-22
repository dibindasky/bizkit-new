// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dates_to_remember.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatesToRemember _$DatesToRememberFromJson(Map<String, dynamic> json) =>
    DatesToRemember(
      date: json['date'] as String?,
      description: json['description'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$DatesToRememberToJson(DatesToRemember instance) =>
    <String, dynamic>{
      'date': instance.date,
      'description': instance.description,
      '_id': instance.id,
    };
