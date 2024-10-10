// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationQuery _$PaginationQueryFromJson(Map<String, dynamic> json) =>
    PaginationQuery(
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationQueryToJson(PaginationQuery instance) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.pageSize,
    };
