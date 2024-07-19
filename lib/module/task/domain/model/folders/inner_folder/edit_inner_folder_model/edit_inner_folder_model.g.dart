// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_inner_folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditInnerFolderModel _$EditInnerFolderModelFromJson(
        Map<String, dynamic> json) =>
    EditInnerFolderModel(
      folderId: json['folder_id'] as String?,
      innerFolderId: json['inner_folder_id'] as String?,
      innerFolderName: json['inner_folder_name'] as String?,
    );

Map<String, dynamic> _$EditInnerFolderModelToJson(
        EditInnerFolderModel instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'inner_folder_id': instance.innerFolderId,
      'inner_folder_name': instance.innerFolderName,
    };
