// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionsList _$ResultFromJson(Map<String, dynamic> json) => ConnectionsList(
      connectionId: json['connection_id'] as String?,
      toUser: json['to_user'] as String?,
      username: json['username'] as String?,
      toCard: json['to_card'] as String?,
      businessName: json['business_name'] as String?,
      businessDesignation: json['business_designation'] as String?,
      connectedDate: json['connected_date'] as String?,
      imageUrl: json['image_url'] as String?,
      connectedViaQr: json['connected_via_qr'] as bool?,
    );

Map<String, dynamic> _$ResultToJson(ConnectionsList instance) =>
    <String, dynamic>{
      'connection_id': instance.connectionId,
      'to_user': instance.toUser,
      'username': instance.username,
      'to_card': instance.toCard,
      'business_name': instance.businessName,
      'business_designation': instance.businessDesignation,
      'connected_date': instance.connectedDate,
      'image_url': instance.imageUrl,
      'connected_via_qr': instance.connectedViaQr,
    };
