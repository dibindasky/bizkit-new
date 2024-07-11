// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinned_tasks_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinnedTasksResponce _$PinnedTasksResponceFromJson(Map<String, dynamic> json) =>
    PinnedTasksResponce(
      pinnedTasks: (json['pinned_tasks'] as List<dynamic>?)
          ?.map((e) => PinnedTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PinnedTasksResponceToJson(
        PinnedTasksResponce instance) =>
    <String, dynamic>{
      'pinned_tasks': instance.pinnedTasks,
    };
