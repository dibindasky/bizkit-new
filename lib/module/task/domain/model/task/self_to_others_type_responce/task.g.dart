// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['task_id'] as String?,
      taskType: json['task_type'] as String?,
      isOwned: json['is_owned'] as bool?,
      spotlightOn: json['spotlight_on'] as bool?,
      isPinned: json['is_pinned'] as bool?,
      createdAt: json['created_at'] as String?,
      deadLine: json['dead_line'] as String?,
      description: json['description'] as String?,
      priorityLevel: json['priority_level'] as String?,
      subtasks: (json['subtasks'] as List<dynamic>?)
          ?.map((e) => SubTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['task_title'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'task_id': instance.id,
      'description': instance.description,
      'task_title': instance.title,
      'created_at': instance.createdAt,
      'dead_line': instance.deadLine,
      'priority_level': instance.priorityLevel,
      'subtasks': instance.subtasks,
      'task_type': instance.taskType,
      'is_owned': instance.isOwned,
      'spotlight_on': instance.spotlightOn,
      'is_pinned': instance.isPinned,
      'status': instance.status,
    };
