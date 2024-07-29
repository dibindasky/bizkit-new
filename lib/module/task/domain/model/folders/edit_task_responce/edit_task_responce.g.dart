// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditTaskModel _$EditTaskModelFromJson(Map<String, dynamic> json) =>
    EditTaskModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      priorityLevel: json['priority_level'] as String?,
      recurrentTask: json['recurrent_task'] as bool?,
      isCompleted: json['is_completed'] as bool?,
      deadLine: json['dead_line'] as String?,
      isKilled: json['is_killed'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTask: (json['sub_task'] as List<dynamic>?)
          ?.map((e) => SubTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignedTo: (json['assigned_to'] as List<dynamic>?)
          ?.map((e) => AssignedToDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskId: json['task_id'] as String?,
    );

Map<String, dynamic> _$EditTaskModelToJson(EditTaskModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'priority_level': instance.priorityLevel,
      'recurrent_task': instance.recurrentTask,
      'is_completed': instance.isCompleted,
      'dead_line': instance.deadLine,
      'is_killed': instance.isKilled,
      'tags': instance.tags,
      'attachments': instance.attachments,
      'sub_task': instance.subTask,
      'assigned_to': instance.assignedTo,
      'task_id': instance.taskId,
    };
