// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_quick_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateQuickTask _$CreateQuickTaskFromJson(Map<String, dynamic> json) =>
    CreateQuickTask(
      title: json['title'] as String?,
      description: json['description'] as String?,
      assignedTo: (json['assigned_to'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateQuickTaskToJson(CreateQuickTask instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'assigned_to': instance.assignedTo,
    };
