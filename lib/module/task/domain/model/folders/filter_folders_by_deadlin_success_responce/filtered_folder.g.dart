// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilteredFolders _$FilteredFoldersFromJson(Map<String, dynamic> json) =>
    FilteredFolders(
      folderId: json['folder_id'] as String?,
      folderName: json['folder_name'] as String?,
      tasksCount: json['tasks_count'] as int?,
    );

Map<String, dynamic> _$FilteredFoldersToJson(FilteredFolders instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'folder_name': instance.folderName,
      'tasks_count': instance.tasksCount,
    };
