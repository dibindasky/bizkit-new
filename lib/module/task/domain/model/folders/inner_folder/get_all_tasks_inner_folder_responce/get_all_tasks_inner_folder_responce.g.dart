// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_tasks_inner_folder_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTasksInnerFolderResponce _$GetAllTasksInnerFolderResponceFromJson(
        Map<String, dynamic> json) =>
    GetAllTasksInnerFolderResponce(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllTasksInnerFolderResponceToJson(
        GetAllTasksInnerFolderResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
