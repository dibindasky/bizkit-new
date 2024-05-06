// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bizkit_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BizkitConnection _$BizkitConnectionFromJson(Map<String, dynamic> json) =>
    BizkitConnection(
      id: json['id'] as int?,
      photos: json['image'] as String?,
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      company: json['company'] as String?,
      isAccepted: json['is_accepted'] as bool?,
      isBlock: json['is_block'] as bool?,
      userId: json['user_id'] as int?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$BizkitConnectionToJson(BizkitConnection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.photos,
      'name': instance.name,
      'designation': instance.designation,
      'company': instance.company,
      'is_accepted': instance.isAccepted,
      'is_block': instance.isBlock,
      'user_id': instance.userId,
      'card_id': instance.cardId,
    };
