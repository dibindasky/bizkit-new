// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinned_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinnedTask _$PinnedTaskFromJson(Map<String, dynamic> json) => PinnedTask(
      taskId: json['task_id'] as String?,
      taskTitle: json['task_title'] as String?,
      description: json['description'] as String?,
      subtasks: (json['subtasks'] as List<dynamic>?)
          ?.map((e) => Subtask.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignedTo: (json['assigned_to'] as List<dynamic>?)
          ?.map((e) => AssignedTo.fromJson(e as Map<String, dynamic>))
          .toList(),
      priorityLevel: json['priority_level'] as String?,
      ispinned: json['is_pinned'] as bool?,
    );

Map<String, dynamic> _$PinnedTaskToJson(PinnedTask instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'task_title': instance.taskTitle,
      'description': instance.description,
      'subtasks': instance.subtasks,
      'assigned_to': instance.assignedTo,
      'priority_level': instance.priorityLevel,
      'is_pinned': instance.ispinned,
    };
