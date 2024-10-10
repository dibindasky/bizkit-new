// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_quick_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteQuickTask _$CompleteQuickTaskFromJson(Map<String, dynamic> json) =>
    CompleteQuickTask(
      quickTaskId: json['quick_task_id'] as String?,
      isCompleted: json['is_completed'] as bool?,
    );

Map<String, dynamic> _$CompleteQuickTaskToJson(CompleteQuickTask instance) =>
    <String, dynamic>{
      'quick_task_id': instance.quickTaskId,
      'is_completed': instance.isCompleted,
    };
