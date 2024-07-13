// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_or_reject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptOrRejectModel _$AcceptOrRejectModelFromJson(Map<String, dynamic> json) =>
    AcceptOrRejectModel(
      taskId: json['task_id'] as String?,
      acceptanceStatus: json['acceptance_status'] as String?,
      taskType: json['task_type'] as String?,
    );

Map<String, dynamic> _$AcceptOrRejectModelToJson(
        AcceptOrRejectModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'acceptance_status': instance.acceptanceStatus,
      'task_type': instance.taskType,
    };
