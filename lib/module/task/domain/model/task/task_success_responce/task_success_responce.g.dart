// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskSuccessResponce _$TaskSuccessResponceFromJson(Map<String, dynamic> json) =>
    TaskSuccessResponce(
      message: json['message'] as String?,
      taskId: json['task_id'] as String?,
    );

Map<String, dynamic> _$TaskSuccessResponceToJson(
        TaskSuccessResponce instance) =>
    <String, dynamic>{
      'message': instance.message,
      'task_id': instance.taskId,
    };
