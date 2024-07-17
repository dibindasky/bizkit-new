// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_sub_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditSubTaskModel _$EditSubTaskModelFromJson(Map<String, dynamic> json) =>
    EditSubTaskModel(
      taskId: json['task_id'] as String?,
      subTaskId: json['sub_task_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      deadLine: json['dead_line'] as String?,
      isCompleted: json['is_completed'] as bool?,
      totalTimeTaken: json['total_time_taken'] as String?,
    );

Map<String, dynamic> _$EditSubTaskModelToJson(EditSubTaskModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'sub_task_id': instance.subTaskId,
      'title': instance.title,
      'description': instance.description,
      'dead_line': instance.deadLine,
      'is_completed': instance.isCompleted,
      'total_time_taken': instance.totalTimeTaken,
    };
