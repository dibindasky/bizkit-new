// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task_add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubTaskAddModel _$SubTaskAddModelFromJson(Map<String, dynamic> json) =>
    SubTaskAddModel(
      taskId: json['task_id'] as String?,
      subTask: json['sub_task'] == null
          ? null
          : SubTasks.fromJson(json['sub_task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubTaskAddModelToJson(SubTaskAddModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'sub_task': instance.subTask,
    };
