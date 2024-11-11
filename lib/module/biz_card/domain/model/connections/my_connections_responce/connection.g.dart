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
      // localId: json['to_user'] as int?,
    );

Map<String, dynamic> _$MyConnectionToJson(MyConnection instance) =>
    <String, dynamic>{
      'to_user': instance.localId,
      // 'toUser': instance.toUser,
      'username': instance.username,
      'cards': instance.cards,
    };
