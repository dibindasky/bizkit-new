// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder_inside_a_folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFolderInsideAFolder _$CreateFolderInsideAFolderFromJson(
        Map<String, dynamic> json) =>
    CreateFolderInsideAFolder(
      folderId: json['folder_id'] as String?,
      innerFolderName: json['inner_folder_name'] as String?,
      innerFolderTasks: json['inner_folder_tasks'] as List<dynamic>?,
    );

Map<String, dynamic> _$CreateFolderInsideAFolderToJson(
        CreateFolderInsideAFolder instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'inner_folder_name': instance.innerFolderName,
      'inner_folder_tasks': instance.innerFolderTasks,
    };
