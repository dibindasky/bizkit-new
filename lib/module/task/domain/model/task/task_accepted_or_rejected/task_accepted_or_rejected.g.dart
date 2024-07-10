// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_accepted_or_rejected.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskAcceptedOrRejected _$TaskAcceptedOrRejectedFromJson(
        Map<String, dynamic> json) =>
    TaskAcceptedOrRejected(
      taskId: json['task_id'] as String?,
      acceptanceStatus: json['acceptance_status'] as String?,
      taskType: json['task_type'] as String?,
    );

Map<String, dynamic> _$TaskAcceptedOrRejectedToJson(
        TaskAcceptedOrRejected instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'acceptance_status': instance.acceptanceStatus,
      'task_type': instance.taskType,
    };
