// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_light_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotLightTask _$SpotLightTaskFromJson(Map<String, dynamic> json) =>
    SpotLightTask(
      taskId: json['task_id'] as String?,
      spotLightStatus: json['spot_light_status'] as bool?,
    );

Map<String, dynamic> _$SpotLightTaskToJson(SpotLightTask instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'spot_light_status': instance.spotLightStatus,
    };
