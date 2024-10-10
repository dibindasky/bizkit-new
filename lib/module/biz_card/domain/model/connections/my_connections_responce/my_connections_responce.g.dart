// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_connections_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyConnectionsResponce _$MyConnectionsResponceFromJson(
        Map<String, dynamic> json) =>
    MyConnectionsResponce(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MyConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool?,
      currentPage: (json['current_page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MyConnectionsResponceToJson(
        MyConnectionsResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
      'has_more': instance.hasMore,
      'current_page': instance.currentPage,
      'page_size': instance.pageSize
    };
