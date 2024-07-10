// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditTaskModel _$EditTaskModelFromJson(Map<String, dynamic> json) =>
    EditTaskModel(
      taskId: json['task_id'] as String?,
      deadLine: json['dead_line'] as String?,
    );

Map<String, dynamic> _$EditTaskModelToJson(EditTaskModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'dead_line': instance.deadLine,
    };
