// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_inner_folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MergeInnerFolderModel _$MergeInnerFolderModelFromJson(
        Map<String, dynamic> json) =>
    MergeInnerFolderModel(
      folderId: json['folder_id'] as String?,
      innerFolders: (json['inner_folders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      newInnerFolderName: json['new_inner_folder_name'] as String?,
    );

Map<String, dynamic> _$MergeInnerFolderModelToJson(
        MergeInnerFolderModel instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'inner_folders': instance.innerFolders,
      'new_inner_folder_name': instance.newInnerFolderName,
    };
