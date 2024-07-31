// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedTaskModel _$CompletedTaskModelFromJson(Map<String, dynamic> json) =>
    CompletedTaskModel(
      taskId: json['task_id'] as String?,
      isCompleted: json['is_completed'] as bool?,
    );

Map<String, dynamic> _$CompletedTaskModelToJson(CompletedTaskModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'is_completed': instance.isCompleted,
    };
