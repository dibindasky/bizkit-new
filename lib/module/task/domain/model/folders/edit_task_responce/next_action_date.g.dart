// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_action_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextActionDate _$NextActionDateFromJson(Map<String, dynamic> json) =>
    NextActionDate(
      date: json['date'] as String?,
      description: json['description'] as String?,
      byWhom: json['by_whom'] as String?,
    );

Map<String, dynamic> _$NextActionDateToJson(NextActionDate instance) =>
    <String, dynamic>{
      'date': instance.date,
      'description': instance.description,
      'by_whom': instance.byWhom
    };
