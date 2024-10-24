// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchConnection _$SearchConnectionFromJson(Map<String, dynamic> json) =>
    SearchConnection(
      toUser: json['to_user'] as String?,
      username: json['username'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchConnectionToJson(SearchConnection instance) =>
    <String, dynamic>{
      'to_user': instance.toUser,
      'username': instance.username,
      'cards': instance.cards,
    };
