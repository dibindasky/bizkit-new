// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_add_or_delete_inner_folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskAddOrDeleteInnerFolderModel _$TaskAddOrDeleteInnerFolderModelFromJson(
        Map<String, dynamic> json) =>
    TaskAddOrDeleteInnerFolderModel(
      folderId: json['folder_id'] as String?,
      innerFolderId: json['inner_folder_id'] as String?,
      innerFolderTasks: (json['inner_folder_tasks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TaskAddOrDeleteInnerFolderModelToJson(
        TaskAddOrDeleteInnerFolderModel instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'inner_folder_id': instance.innerFolderId,
      'inner_folder_tasks': instance.innerFolderTasks,
    };
