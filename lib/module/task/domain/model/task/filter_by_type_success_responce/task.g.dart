// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['_id'] as String?,
      task: json['task'] == null
          ? null
          : Task.fromJson(json['task'] as Map<String, dynamic>),
      taskType: json['task_type'] as String?,
      isOwned: json['is_owned'] as bool?,
      spotlightOn: json['spotlight_on'] as bool?,
      isPinned: json['is_pinned'] as bool?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      '_id': instance.id,
      'task': instance.task,
      'task_type': instance.taskType,
      'is_owned': instance.isOwned,
      'spotlight_on': instance.spotlightOn,
      'is_pinned': instance.isPinned,
    };
