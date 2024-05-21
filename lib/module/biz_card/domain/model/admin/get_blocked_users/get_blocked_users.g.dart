// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_blocked_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBlockedUsers _$GetBlockedUsersFromJson(Map<String, dynamic> json) =>
    GetBlockedUsers(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      blockedUsers: (json['results'] as List<dynamic>?)
          ?.map((e) => BlockedDUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBlockedUsersToJson(GetBlockedUsers instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.blockedUsers,
    };
