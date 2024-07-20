// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_inner_folder_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterInnerFolderSuccessResponce _$FilterInnerFolderSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    FilterInnerFolderSuccessResponce(
      filteredFolders: (json['filtered_folders'] as List<dynamic>?)
          ?.map((e) => FilteredFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterInnerFolderSuccessResponceToJson(
        FilterInnerFolderSuccessResponce instance) =>
    <String, dynamic>{
      'filtered_folders': instance.filteredFolders,
    };
