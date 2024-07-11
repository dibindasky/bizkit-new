// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_tasks_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      id: json['_id'] as String?,
      createdBy: json['created_by'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      priorityLevel: json['priority_level'] as String?,
      recurrentTask: json['recurrent_task'] as bool?,
      isCompleted: json['is_completed'] as bool?,
      deadLine: json['dead_line'] as String?,
      isKilled: json['is_killed'] as bool?,
      tags: json['tags'] as List<dynamic>?,
      attachments: json['attachments'] as List<dynamic>?,
      subTask: json['sub_task'] as List<dynamic>?,
      assignedTo: json['assigned_to'] as List<dynamic>?,
      isOwned: json['is_owned'] as bool?,
    );

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
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
      'is_owned': instance.isOwned,
    };

AllTasksResponce _$AllTasksResponceFromJson(Map<String, dynamic> json) =>
    AllTasksResponce(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Tasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllTasksResponceToJson(AllTasksResponce instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
