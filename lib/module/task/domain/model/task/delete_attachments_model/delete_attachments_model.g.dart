// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_attachments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAttachmentsModel _$DeleteAttachmentsModelFromJson(
        Map<String, dynamic> json) =>
    DeleteAttachmentsModel(
      taskId: json['task_id'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DeleteAttachmentsModelToJson(
        DeleteAttachmentsModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'attachments': instance.attachments,
    };
