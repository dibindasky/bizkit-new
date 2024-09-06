// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyConnection _$ConnectionFromJson(Map<String, dynamic> json) => MyConnection(
      connectionId: json['connection_id'] as String?,
      toUser: json['to_user'] as String?,
      username: json['username'] as String?,
      toCard: json['to_card'] as String?,
      businessName: json['business_name'] as String?,
      businessDesignation: json['business_designation'] as String?,
      connectedDate: json['connected_date'] == null
          ? null
          : DateTime.parse(json['connected_date'] as String),
      imageUrl: json['image_url'],
    );

Map<String, dynamic> _$ConnectionToJson(MyConnection instance) =>
    <String, dynamic>{
      'connection_id': instance.connectionId,
      'to_user': instance.toUser,
      'username': instance.username,
      'to_card': instance.toCard,
      'business_name': instance.businessName,
      'business_designation': instance.businessDesignation,
      'connected_date': instance.connectedDate?.toIso8601String(),
      'image_url': instance.imageUrl,
    };
