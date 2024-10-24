// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_to_others_type_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfToOthersTypeResponce _$SelfToOthersTypeResponceFromJson(
        Map<String, dynamic> json) =>
    SelfToOthersTypeResponce(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['current_page'] as int?,
      hasMore: json['has_more'] as bool?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$SelfToOthersTypeResponceToJson(
        SelfToOthersTypeResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
      'current_page': instance.currentPage,
      'page_size': instance.pageSize,
      'has_more': instance.hasMore,
    };
