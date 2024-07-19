// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tasks_inside_folder_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTasksInsideFolderSuccessResponce
    _$GetTasksInsideFolderSuccessResponceFromJson(Map<String, dynamic> json) =>
        GetTasksInsideFolderSuccessResponce(
          data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => InSideFolderDatum.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$GetTasksInsideFolderSuccessResponceToJson(
        GetTasksInsideFolderSuccessResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
