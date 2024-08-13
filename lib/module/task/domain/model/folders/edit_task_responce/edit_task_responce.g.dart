// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditTaskModel _$EditTaskModelFromJson(Map<String, dynamic> json) =>
    EditTaskModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      taskId: json['task_id'] as String?,
      assignedTo: (json['assigned_to'] as List<dynamic>?)
          ?.map((e) => TaskAssignedTo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EditTaskModelToJson(EditTaskModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'task_id': instance.taskId,
      'assigned_to': instance.assignedTo,
    };
