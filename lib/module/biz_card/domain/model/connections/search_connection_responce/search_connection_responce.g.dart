// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_connection_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchConnectionResponce _$SearchConnectionResponceFromJson(
        Map<String, dynamic> json) =>
    SearchConnectionResponce(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SearchConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['current_page'] as int?,
      hasMore: json['has_more'] as bool?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$SearchConnectionResponceToJson(
        SearchConnectionResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
      'has_more': instance.hasMore,
      'current_page': instance.currentPage,
      'page_size': instance.pageSize,
    };
