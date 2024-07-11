// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinned_a_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinnedATaskModel _$PinnedATaskModelFromJson(Map<String, dynamic> json) =>
    PinnedATaskModel(
      taskId: json['task_id'] as String?,
      isPinned: json['is_pinned'] as bool?,
    );

Map<String, dynamic> _$PinnedATaskModelToJson(PinnedATaskModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'is_pinned': instance.isPinned,
    };
