// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_sub_task_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedSubTaskSuccessResponce _$CompletedSubTaskSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    CompletedSubTaskSuccessResponce(
      message: json['message'] as String?,
      subTask: (json['sub_task'] as List<dynamic>?)
          ?.map((e) => CompletedSubTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompletedSubTaskSuccessResponceToJson(
        CompletedSubTaskSuccessResponce instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sub_task': instance.subTask,
    };
