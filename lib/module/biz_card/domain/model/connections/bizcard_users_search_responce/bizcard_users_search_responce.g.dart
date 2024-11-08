// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bizcard_users_search_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BizcardUsersSearchResponce _$BizcardUsersSearchResponceFromJson(
        Map<String, dynamic> json) =>
    BizcardUsersSearchResponce(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BizCardUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool?,
      currentPage: json['current_page'] as int?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$BizcardUsersSearchResponceToJson(
        BizcardUsersSearchResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
      'has_more': instance.hasMore,
      'current_page': instance.currentPage,
      'page_size': instance.pageSize,
    };
