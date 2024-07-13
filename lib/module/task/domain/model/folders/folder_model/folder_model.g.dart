// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderModel _$FolderModelFromJson(Map<String, dynamic> json) => FolderModel(
      folderName: json['folder_name'] as String?,
      tasks:
          (json['tasks'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FolderModelToJson(FolderModel instance) =>
    <String, dynamic>{
      'folder_name': instance.folderName,
      'tasks': instance.tasks,
    };
