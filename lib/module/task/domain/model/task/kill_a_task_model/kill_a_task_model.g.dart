// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kill_a_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KillATaskModel _$KillATaskModelFromJson(Map<String, dynamic> json) =>
    KillATaskModel(
      isKilled: json['is_killed'] as bool?,
      taskId: json['task_id'] as String?,
    );

Map<String, dynamic> _$KillATaskModelToJson(KillATaskModel instance) =>
    <String, dynamic>{
      'is_killed': instance.isKilled,
      'task_id': instance.taskId,
    };
