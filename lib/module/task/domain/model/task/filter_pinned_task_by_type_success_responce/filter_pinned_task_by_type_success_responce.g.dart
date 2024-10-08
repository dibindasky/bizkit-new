// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_pinned_task_by_type_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterPinnedTaskByTypeSuccessResponce
    _$FilterPinnedTaskByTypeSuccessResponceFromJson(
            Map<String, dynamic> json) =>
        FilterPinnedTaskByTypeSuccessResponce(
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList(),
          currentPage: (json['current_page'] as num?)?.toInt(),
          pageSize: (json['page_size'] as num?)?.toInt(),
          hasMore: json['has_more'] as bool?,
        );

Map<String, dynamic> _$FilterPinnedTaskByTypeSuccessResponceToJson(
        FilterPinnedTaskByTypeSuccessResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
      'current_page': instance.currentPage,
      'page_size': instance.pageSize,
      'has_more': instance.hasMore,
    };
