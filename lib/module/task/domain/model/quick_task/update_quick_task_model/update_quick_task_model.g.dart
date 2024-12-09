// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_quick_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateQuickTaskModel _$UpdateQuickTaskModelFromJson(
        Map<String, dynamic> json) =>
    UpdateQuickTaskModel(
      quickTaskId: json['quick_task_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      assignedTo: (json['assigned_to'] as List<dynamic>?)
          ?.map((e) => QuickTaskAssignedTo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateQuickTaskModelToJson(
        UpdateQuickTaskModel instance) =>
    <String, dynamic>{
      'quick_task_id': instance.quickTaskId,
      'title': instance.title,
      'description': instance.description,
      'assigned_to': instance.assignedTo,
    };
