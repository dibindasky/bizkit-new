// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_by_deadline_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterByDeadlineResponce _$FilterByDeadlineResponceFromJson(
        Map<String, dynamic> json) =>
    FilterByDeadlineResponce(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterByDeadlineResponceToJson(
        FilterByDeadlineResponce instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
