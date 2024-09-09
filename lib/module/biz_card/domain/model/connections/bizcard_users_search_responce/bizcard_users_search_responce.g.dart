// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bizcard_users_search_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BizcardUsersSearchResponce _$BizcardUsersSearchResponceFromJson(
        Map<String, dynamic> json) =>
    BizcardUsersSearchResponce(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => BizCardUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BizcardUsersSearchResponceToJson(
        BizcardUsersSearchResponce instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
