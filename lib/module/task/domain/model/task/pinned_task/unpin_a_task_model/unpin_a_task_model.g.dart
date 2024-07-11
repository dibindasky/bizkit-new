// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unpin_a_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnpinATaskModel _$UnpinATaskModelFromJson(Map<String, dynamic> json) =>
    UnpinATaskModel(
      taskId: json['task_id'] as String?,
      isPinned: json['is_pinned'] as bool?,
    );

Map<String, dynamic> _$UnpinATaskModelToJson(UnpinATaskModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'is_pinned': instance.isPinned,
    };
