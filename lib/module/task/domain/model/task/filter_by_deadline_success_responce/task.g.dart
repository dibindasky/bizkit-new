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
      type: json['type'] as String?,
      isOwned: json['is_owned'] as bool?,
      spotlightOn: json['spotlight_on'] as bool?,
      isPinned: json['is_pinned'] as bool?,
      isAccepted: json['is_accepted'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      '_id': instance.id,
      'task': instance.task,
      'type': instance.type,
      'is_owned': instance.isOwned,
      'spotlight_on': instance.spotlightOn,
      'is_pinned': instance.isPinned,
      'is_accepted': instance.isAccepted,
    };
