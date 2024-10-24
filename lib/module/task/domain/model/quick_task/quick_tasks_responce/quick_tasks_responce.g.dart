// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_tasks_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuickTasksResponce _$QuickTasksResponceFromJson(Map<String, dynamic> json) =>
    QuickTasksResponce(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QuickTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageSize: json['page_size'] as int?,
      currentPage: json['current_page'] as int?,
      hasMore: json['has_more'] as bool?,
    );

Map<String, dynamic> _$QuickTasksResponceToJson(QuickTasksResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page_size': instance.pageSize,
      'current_page': instance.currentPage,
      'has_more': instance.hasMore,
    };
