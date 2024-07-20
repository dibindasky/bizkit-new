// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilteredFolder _$FilteredFolderFromJson(Map<String, dynamic> json) =>
    FilteredFolder(
      folderId: json['folder_id'] as String?,
      innerFolderId: json['inner_folder_id'] as String?,
      innerFolderName: json['inner_folder_name'] as String?,
      tasksCount: json['tasks_count'] as int?,
    );

Map<String, dynamic> _$FilteredFolderToJson(FilteredFolder instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'inner_folder_id': instance.innerFolderId,
      'inner_folder_name': instance.innerFolderName,
      'tasks_count': instance.tasksCount,
    };
