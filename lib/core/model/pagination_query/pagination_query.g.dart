// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationQuery _$PaginationQueryFromJson(Map<String, dynamic> json) =>
    PaginationQuery(
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
      completedTasks: json['completed_tasks'] as bool?,
    );

Map<String, dynamic> _$PaginationQueryToJson(PaginationQuery instance) =>
    <String, dynamic>{
      'completed_tasks': instance.completedTasks,
      'page': instance.page,
      'page_size': instance.pageSize,
    };
