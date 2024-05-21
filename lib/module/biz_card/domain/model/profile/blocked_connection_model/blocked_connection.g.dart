// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockedConnection _$BlockedConnectionFromJson(Map<String, dynamic> json) =>
    BlockedConnection(
      id: json['id'] as int?,
      photos: json['photos'],
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      company: json['company'] as String?,
      tag: json['tag'],
      isAccepted: json['is_accepted'] as bool?,
      isBlocked: json['is_blocked'] as bool?,
      userId: json['user_id'] as int?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$BlockedConnectionToJson(BlockedConnection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photos': instance.photos,
      'name': instance.name,
      'designation': instance.designation,
      'company': instance.company,
      'tag': instance.tag,
      'is_accepted': instance.isAccepted,
      'is_blocked': instance.isBlocked,
      'user_id': instance.userId,
      'card_id': instance.cardId,
    };
