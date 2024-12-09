// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_quick_task_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceivedQuickTaskRequests _$ReceivedQuickTaskRequestsFromJson(
        Map<String, dynamic> json) =>
    ReceivedQuickTaskRequests(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QuickTaskRequests.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      hasMore: json['has_more'] as bool?,
    );

Map<String, dynamic> _$ReceivedQuickTaskRequestsToJson(
        ReceivedQuickTaskRequests instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page_size': instance.pageSize,
      'current_page': instance.currentPage,
      'has_more': instance.hasMore,
    };
