// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_quick_task_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateQuickTaskResponce _$CreateQuickTaskResponceFromJson(
        Map<String, dynamic> json) =>
    CreateQuickTaskResponce(
      message: json['message'] as String?,
      quickTaskId: json['quick_task_id'] as String?,
    );

Map<String, dynamic> _$CreateQuickTaskResponceToJson(
        CreateQuickTaskResponce instance) =>
    <String, dynamic>{
      'message': instance.message,
      'quick_task_id': instance.quickTaskId,
    };
