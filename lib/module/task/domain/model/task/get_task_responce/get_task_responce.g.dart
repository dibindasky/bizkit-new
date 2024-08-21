// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_task_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTaskResponce _$GetTaskResponceFromJson(Map<String, dynamic> json) =>
    GetTaskResponce(
      id: json['_id'] as String?,
      createdBy: json['created_by'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      priorityLevel: json['priority_level'] as String?,
      recurrentTask: json['recurrent_task'] as bool?,
      isCompleted: json['is_completed'] as bool?,
      isOwned: json['is_owned'] as bool?,
      deadLine: json['dead_line'] as String?,
      isKilled: json['is_killed'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTask: (json['sub_task'] as List<dynamic>?)
          ?.map((e) => SubTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      status: json['status'] as String?,
      assignedToDetails: (json['assigned_to_details'] as List<dynamic>?)
          ?.map((e) => AssignedToDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..createdUserDetails = json['created_user_details'] == null
        ? null
        : CreatedUserDetails.fromJson(
            json['created_user_details'] as Map<String, dynamic>);

Map<String, dynamic> _$GetTaskResponceToJson(GetTaskResponce instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'created_by': instance.createdBy,
      'title': instance.title,
      'description': instance.description,
      'priority_level': instance.priorityLevel,
      'recurrent_task': instance.recurrentTask,
      'is_completed': instance.isCompleted,
      'dead_line': instance.deadLine,
      'is_killed': instance.isKilled,
      'tags': instance.tags,
      'attachments': instance.attachments,
      'sub_task': instance.subTask,
      'created_at': instance.createdAt?.toIso8601String(),
      'status': instance.status,
      'is_owned': instance.isOwned,
      'created_user_details': instance.createdUserDetails,
      'assigned_to_details': instance.assignedToDetails,
    };
