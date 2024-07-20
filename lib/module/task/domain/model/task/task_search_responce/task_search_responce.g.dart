// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_search_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskSearchResponce _$TaskSearchResponceFromJson(Map<String, dynamic> json) =>
    TaskSearchResponce(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskSearchResponceToJson(TaskSearchResponce instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
