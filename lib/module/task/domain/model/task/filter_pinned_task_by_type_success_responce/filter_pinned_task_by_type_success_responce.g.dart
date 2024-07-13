// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_pinned_task_by_type_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterPinnedTaskByTypeSuccessResponce
    _$FilterPinnedTaskByTypeSuccessResponceFromJson(
            Map<String, dynamic> json) =>
        FilterPinnedTaskByTypeSuccessResponce(
          tasks: (json['tasks'] as List<dynamic>?)
              ?.map(
                  (e) => PinnedTasksByTypes.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$FilterPinnedTaskByTypeSuccessResponceToJson(
        FilterPinnedTaskByTypeSuccessResponce instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
