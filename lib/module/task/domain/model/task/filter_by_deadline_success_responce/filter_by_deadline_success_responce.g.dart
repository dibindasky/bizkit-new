// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_by_deadline_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterByDeadlineSuccessResponce _$FilterByDeadlineSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    FilterByDeadlineSuccessResponce(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterByDeadlineSuccessResponceToJson(
        FilterByDeadlineSuccessResponce instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
