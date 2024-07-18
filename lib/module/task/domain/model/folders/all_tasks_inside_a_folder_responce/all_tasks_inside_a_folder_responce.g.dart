// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_tasks_inside_a_folder_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllTasksInsideAFolderResponce _$AllTasksInsideAFolderResponceFromJson(
        Map<String, dynamic> json) =>
    AllTasksInsideAFolderResponce(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TasksInsideFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllTasksInsideAFolderResponceToJson(
        AllTasksInsideAFolderResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
