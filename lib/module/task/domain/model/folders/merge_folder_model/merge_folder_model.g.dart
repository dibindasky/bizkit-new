// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MergeFolderModel _$MergeFolderModelFromJson(Map<String, dynamic> json) =>
    MergeFolderModel(
      folderName: json['folder_name'] as String?,
      folders:
          (json['folders'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MergeFolderModelToJson(MergeFolderModel instance) =>
    <String, dynamic>{
      'folder_name': instance.folderName,
      'folders': instance.folders,
    };
