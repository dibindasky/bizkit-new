// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksCompletedOrKilled _$TaskFromJson(Map<String, dynamic> json) =>
    TasksCompletedOrKilled(
      taskId: json['task_id'] as String?,
      taskTitle: json['task_title'] as String?,
      description: json['description'] as String?,
      subtasks: json['subtasks'] as List<dynamic>?,
      priorityLevel: json['priority_level'] as String?,
      isOwned: json['is_owned'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deadLine: json['dead_line'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskToJson(TasksCompletedOrKilled instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'task_title': instance.taskTitle,
      'description': instance.description,
      'subtasks': instance.subtasks,
      'priority_level': instance.priorityLevel,
      'created_at': instance.createdAt?.toIso8601String(),
      'dead_line': instance.deadLine,
      'created_by': instance.createdBy,
      'is_owned': instance.isOwned,
    };
