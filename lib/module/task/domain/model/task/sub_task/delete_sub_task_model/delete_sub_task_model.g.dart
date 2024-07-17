// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_sub_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteSubTaskModel _$DeleteSubTaskModelFromJson(Map<String, dynamic> json) =>
    DeleteSubTaskModel(
      taskId: json['task_id'] as String?,
      subTaskId: json['sub_task_id'] as String?,
    );

Map<String, dynamic> _$DeleteSubTaskModelToJson(DeleteSubTaskModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'sub_task_id': instance.subTaskId,
    };
