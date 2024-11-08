// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_search_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskSearchResponce _$TaskSearchResponceFromJson(Map<String, dynamic> json) =>
    TaskSearchResponce(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['current_page'] as int?,
      hasMore: json['has_more'] as bool?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$TaskSearchResponceToJson(TaskSearchResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
      'has_more': instance.hasMore,
      'current_page': instance.currentPage,
      'page_size': instance.pageSize,
    };
