// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyConnection _$MyConnectionFromJson(Map<String, dynamic> json) => MyConnection(
      toUser: json['to_user'] as String?,
      username: json['username'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
      localId: json['localId'] as int?,
      lastConnected: json['last_connected'] as String?,
    );

Map<String, dynamic> _$MyConnectionToJson(MyConnection instance) =>
    <String, dynamic>{
      'to_user': instance.toUser,
      'username': instance.username,
      'cards': instance.cards,
      'localId': instance.localId,
      'last_connected': instance.lastConnected,
    };
