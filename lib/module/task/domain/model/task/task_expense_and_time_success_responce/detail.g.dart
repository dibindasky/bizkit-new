// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      time: json['time'] as int?,
      expense: json['expense'] as int?,
      description: json['description'] as String?,
      updatedTime: json['updated_time'] as String,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'time': instance.time,
      'expense': instance.expense,
      'description': instance.description,
    };
