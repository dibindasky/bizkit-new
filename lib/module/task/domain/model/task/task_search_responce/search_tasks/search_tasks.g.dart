// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchTask _$SearchTaskFromJson(Map<String, dynamic> json) => SearchTask(
      createdBy: json['created_by'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      priorityLevel: json['priority_level'] as String?,
      recurrentTask: json['recurrent_task'] as bool?,
      isCompleted: json['is_completed'] as bool?,
      deadLine: json['dead_line'] as String?,
      isKilled: json['is_killed'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTask: (json['sub_task'] as List<dynamic>?)
          ?.map((e) => SubTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$SearchTaskToJson(SearchTask instance) =>
    <String, dynamic>{
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
      'created_at': instance.createdAt,
      '_id': instance.id,
    };
