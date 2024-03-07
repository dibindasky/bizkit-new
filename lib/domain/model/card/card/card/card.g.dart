// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      id: json['id'] as int?,
      personalDetails: json['personal_details'] == null
          ? null
          : PersonalDetails.fromJson(
              json['personal_details'] as Map<String, dynamic>),
      businessDetails: json['business_details'] == null
          ? null
          : BusinessDetails.fromJson(
              json['business_details'] as Map<String, dynamic>),
      isDefault: json['is_default'] as bool?,
      userId: json['user_id'] as int?,
      cardLink: json['card_link'] as String?,
      share: json['share'] as int?,
      connectionId: json['connection_id'] as int?,
      views: json['views'] as int?,
    )
      ..isArchived = json['is_archived'] as bool?
      ..isVerified = json['is_verified'] as bool?
      ..connectionRequestId = json['connection_request_id'] as int?;

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'id': instance.id,
      'personal_details': instance.personalDetails,
      'business_details': instance.businessDetails,
      'is_default': instance.isDefault,
      'is_archived': instance.isArchived,
      'is_verified': instance.isVerified,
      'user_id': instance.userId,
      'share': instance.share,
      'views': instance.views,
      'connection_id': instance.connectionId,
      'connection_request_id': instance.connectionRequestId,
      'card_link': instance.cardLink,
    };
