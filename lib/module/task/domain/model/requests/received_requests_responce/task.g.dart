// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceivedTask _$ReceivedTaskFromJson(Map<String, dynamic> json) => ReceivedTask(
      taskId: json['task_id'] as String?,
      taskTitle: json['task_title'] as String?,
      description: json['description'] as String?,
      subtasks: json['subtasks'] as List<dynamic>?,
      priorityLevel: json['priority_level'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deadLine: json['dead_line'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReceivedTaskToJson(ReceivedTask instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'task_title': instance.taskTitle,
      'description': instance.description,
      'subtasks': instance.subtasks,
      'priority_level': instance.priorityLevel,
      'created_at': instance.createdAt?.toIso8601String(),
      'dead_line': instance.deadLine,
      'created_by': instance.createdBy,
    };
