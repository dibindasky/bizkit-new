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
      deadLine: json['dead_line'] as String?,
      isKilled: json['is_killed'] as bool?,
      tags: json['tags'] as List<String>?,
      attachments: json['attachments'] as List<String>?,
      subTask: json['sub_task'] as List<String>?,
      assignedTo: (json['assigned_to'] as List<String>?)
          ?.map((e) => TaskAssignedTo.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

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
      'assigned_to': instance.assignedTo,
      'created_at': instance.createdAt?.toIso8601String(),
    };
