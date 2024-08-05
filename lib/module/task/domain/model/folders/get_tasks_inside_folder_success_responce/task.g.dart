// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsideAFolderTasks _$InsideAFolderTasksFromJson(Map<String, dynamic> json) =>
    InsideAFolderTasks(
      taskId: json['task_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      priorityLevel: json['priority_level'] as String?,
      recurrentTask: json['recurrent_task'] as bool?,
      isCompleted: json['is_completed'] as bool?,
      deadLine: json['dead_line'] as String?,
      isKilled: json['is_killed'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isOwned: json['is_owned'] as bool?,
      spotlightOn: json['spotlight_on'] as bool?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      createdAt:
          json['created_at'] == null ? null : (json['created_at'] as String),
    );

Map<String, dynamic> _$InsideAFolderTasksToJson(InsideAFolderTasks instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'title': instance.title,
      'description': instance.description,
      'priority_level': instance.priorityLevel,
      'recurrent_task': instance.recurrentTask,
      'is_completed': instance.isCompleted,
      'dead_line': instance.deadLine,
      'is_killed': instance.isKilled,
      'tags': instance.tags,
      'is_owned': instance.isOwned,
      'spotlight_on': instance.spotlightOn,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
    };
