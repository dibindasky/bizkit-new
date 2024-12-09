// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuickTaskRequests _$DatumFromJson(Map<String, dynamic> json) =>
    QuickTaskRequests(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$DatumToJson(QuickTaskRequests instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
    };
