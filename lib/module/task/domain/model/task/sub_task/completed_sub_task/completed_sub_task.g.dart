// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_sub_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedSubTask _$CompletedSubTaskFromJson(Map<String, dynamic> json) =>
    CompletedSubTask(
      taskId: json['task_id'] as String?,
      subTaskId: json['sub_task_id'] as String?,
      isCompleted: json['is_completed'] as bool?,
      totalTimeTaken: json['total_time_taken'] as String,
    );

Map<String, dynamic> _$CompletedSubTaskToJson(CompletedSubTask instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'sub_task_id': instance.subTaskId,
      'is_completed': instance.isCompleted,
      'total_time_taken': instance.totalTimeTaken,
    };
