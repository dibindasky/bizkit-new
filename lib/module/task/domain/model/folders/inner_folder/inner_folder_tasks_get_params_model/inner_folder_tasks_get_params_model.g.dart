// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inner_folder_tasks_get_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InnerFolderTasksGetParamsModel _$InnerFolderTasksGetParamsModelFromJson(
        Map<String, dynamic> json) =>
    InnerFolderTasksGetParamsModel(
      folderId: json['folder_id'] as String?,
      innerFolderId: json['inner_folder_id'] as String?,
    );

Map<String, dynamic> _$InnerFolderTasksGetParamsModelToJson(
        InnerFolderTasksGetParamsModel instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'inner_folder_id': instance.innerFolderId,
    };
