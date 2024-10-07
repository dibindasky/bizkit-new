// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_by_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterByTypeModel _$FilterByTypeModelFromJson(Map<String, dynamic> json) =>
    FilterByTypeModel(
      taskType: json['task_type'] as String?,
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$FilterByTypeModelToJson(FilterByTypeModel instance) =>
    <String, dynamic>{
      'task_type': instance.taskType,
      'page': instance.page,
      'page_size': instance.pageSize,
    };
