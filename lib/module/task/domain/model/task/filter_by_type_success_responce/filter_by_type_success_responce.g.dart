// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_by_type_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterByTypeSuccessResponce _$FilterByTypeSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    FilterByTypeSuccessResponce(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterByTypeSuccessResponceToJson(
        FilterByTypeSuccessResponce instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
