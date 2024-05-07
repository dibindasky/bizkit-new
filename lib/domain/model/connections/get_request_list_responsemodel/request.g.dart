// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) => RequestModel(
      id: json['id'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      company: json['company'] as String?,
      designation: json['designation'] as String?,
      userId: json['user_id'] as int?,
      cardUserId: json['card_user_id'] as int?,
      hasConnection: json['has_connection'] as bool?,
    );

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'company': instance.company,
      'designation': instance.designation,
      'user_id': instance.userId,
      'card_user_id': instance.cardUserId,
      'has_connection': instance.hasConnection,
    };
