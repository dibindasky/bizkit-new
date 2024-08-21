// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentTasks _$RecentTasksFromJson(Map<String, dynamic> json) => RecentTasks(
      taskId: json['task_id'] as String?,
      taskTitle: json['task_title'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deadLine: json['dead_line'] as String?,
      isOwned: json['is_owned'] as bool?,
      status: json['status'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentTasksToJson(RecentTasks instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'task_title': instance.taskTitle,
      'created_at': instance.createdAt?.toIso8601String(),
      'dead_line': instance.deadLine,
      'is_owned': instance.isOwned,
      'status': instance.status,
      'created_by': instance.createdBy,
    };
