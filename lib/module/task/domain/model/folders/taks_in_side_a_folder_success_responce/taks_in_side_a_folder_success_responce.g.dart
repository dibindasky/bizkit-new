// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taks_in_side_a_folder_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllTasksInsideAFolderSuccessResponse
    _$AllTasksInsideAFolderSuccessResponseFromJson(Map<String, dynamic> json) =>
        AllTasksInsideAFolderSuccessResponse(
          data: (json['data'] as List<dynamic>)
              .map((e) => FolderModels.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$AllTasksInsideAFolderSuccessResponseToJson(
        AllTasksInsideAFolderSuccessResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

FolderModels _$FolderModelsFromJson(Map<String, dynamic> json) => FolderModels(
      id: json['_id'] as String,
      folderName: json['folder_name'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FolderModelsToJson(FolderModels instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'folder_name': instance.folderName,
      'tasks': instance.tasks,
    };

TaskModels _$TaskModelsFromJson(Map<String, dynamic> json) => TaskModels(
      taskId: json['task_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      priorityLevel: json['priority_level'] as String,
      recurrentTask: json['recurrent_task'] as bool,
      isCompleted: json['is_completed'] as bool,
      deadLine: json['dead_line'] as String,
      isKilled: json['is_killed'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => Attachments.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTask: (json['sub_task'] as List<dynamic>)
          .map((e) => SubTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskModelsToJson(TaskModels instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
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
    };

Attachments _$AttachmentsFromJson(Map<String, dynamic> json) => Attachments(
      attachment: json['attachment'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AttachmentsToJson(Attachments instance) =>
    <String, dynamic>{
      'attachment': instance.attachment,
      'type': instance.type,
    };

SubTasks _$SubTasksFromJson(Map<String, dynamic> json) => SubTasks(
      title: json['title'] as String,
      description: json['description'] as String,
      deadLine: json['dead_line'] as String,
      isCompleted: json['is_completed'] as bool,
      totalTimeTaken: json['total_time_taken'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$SubTasksToJson(SubTasks instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'dead_line': instance.deadLine,
      'is_completed': instance.isCompleted,
      'total_time_taken': instance.totalTimeTaken,
      '_id': instance.id,
    };
