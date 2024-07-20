// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_folders_by_deadlin_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterFoldersByDeadlinSuccessResponce
    _$FilterFoldersByDeadlinSuccessResponceFromJson(
            Map<String, dynamic> json) =>
        FilterFoldersByDeadlinSuccessResponce(
          filteredFolders: (json['filtered_folders'] as List<dynamic>?)
              ?.map((e) => FilteredFolders.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$FilterFoldersByDeadlinSuccessResponceToJson(
        FilterFoldersByDeadlinSuccessResponce instance) =>
    <String, dynamic>{
      'filtered_folders': instance.filteredFolders,
    };
