// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderAddModel _$FolderAddModelFromJson(Map<String, dynamic> json) =>
    FolderAddModel(
      folderId: json['folder_id'] as String?,
      tasks:
          (json['tasks'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FolderAddModelToJson(FolderAddModel instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'tasks': instance.tasks,
    };
