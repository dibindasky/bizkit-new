// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InSideFolderDatum _$InSideFolderDatumFromJson(Map<String, dynamic> json) =>
    InSideFolderDatum(
      id: json['_id'] as String?,
      folderName: json['folder_name'] as String?,
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => InsideAFolderTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
      innerFolders: (json['inner_folders'] as List<dynamic>?)
          ?.map((e) => InnerFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InSideFolderDatumToJson(InSideFolderDatum instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'folder_name': instance.folderName,
      'tasks': instance.tasks,
      'inner_folders': instance.innerFolders,
    };
