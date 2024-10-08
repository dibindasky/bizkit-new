// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_pinned_task_by_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterPinnedTaskByTypeModel _$FilterPinnedTaskByTypeModelFromJson(
        Map<String, dynamic> json) =>
    FilterPinnedTaskByTypeModel(
      taskType: json['task_type'] as String?,
      isPinned: json['is_pinned'] as bool?,
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$FilterPinnedTaskByTypeModelToJson(
        FilterPinnedTaskByTypeModel instance) =>
    <String, dynamic>{
      'task_type': instance.taskType,
      'is_pinned': instance.isPinned,
      'page': instance.page,
      'page_size': instance.pageSize,
    };
