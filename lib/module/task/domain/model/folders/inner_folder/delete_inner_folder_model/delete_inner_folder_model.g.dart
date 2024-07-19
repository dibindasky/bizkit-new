// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_inner_folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteInnerFolderModel _$DeleteInnerFolderModelFromJson(
        Map<String, dynamic> json) =>
    DeleteInnerFolderModel(
      folderId: json['folder_id'] as String?,
      innerFolderId: json['inner_folder_id'] as String?,
    );

Map<String, dynamic> _$DeleteInnerFolderModelToJson(
        DeleteInnerFolderModel instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'inner_folder_id': instance.innerFolderId,
    };
