// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchQuery _$SearchQueryFromJson(Map<String, dynamic> json) => SearchQuery(
    search: json['search_term'] as String?,
    page: (json['page'] as num?)?.toInt(),
    pageSize: (json['page_size'] as num?)?.toInt());

Map<String, dynamic> _$SearchQueryToJson(SearchQuery instance) =>
    <String, dynamic>{
      'search_term': instance.search,
      'page':instance.page,
      'page_size':instance.pageSize
    };
