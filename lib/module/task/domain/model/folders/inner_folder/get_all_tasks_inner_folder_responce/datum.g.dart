// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['_id'] as String?,
      innerFolderName: json['inner_folder_name'] as String?,
      innerFolderTasks: (json['inner_folder_tasks'] as List<dynamic>?)
          ?.map((e) => InnerFolderTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      '_id': instance.id,
      'inner_folder_name': instance.innerFolderName,
      'inner_folder_tasks': instance.innerFolderTasks,
    };
