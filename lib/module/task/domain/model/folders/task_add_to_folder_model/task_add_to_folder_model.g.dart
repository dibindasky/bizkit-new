// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_add_to_folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskAddToFolderModel _$TaskAddToFolderModelFromJson(
        Map<String, dynamic> json) =>
    TaskAddToFolderModel(
      folderId: json['folder_id'] as String?,
      tasks:
          (json['tasks'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TaskAddToFolderModelToJson(
        TaskAddToFolderModel instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'tasks': instance.tasks,
    };
