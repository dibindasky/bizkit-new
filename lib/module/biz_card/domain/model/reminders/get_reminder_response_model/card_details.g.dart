// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDetails _$CardDetailsFromJson(Map<String, dynamic> json) => CardDetails(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      isDefault: json['is_default'] as bool?,
      isArchived: json['is_archived'] as bool?,
      views: json['views'] as int?,
      share: json['share'] as int?,
      isVerified: json['is_verified'] as bool?,
      personalDetailsId: json['personal_details_id'] as int?,
      businessDetailsId: json['business_details_id'] as int?,
    );

Map<String, dynamic> _$CardDetailsToJson(CardDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'is_default': instance.isDefault,
      'is_archived': instance.isArchived,
      'views': instance.views,
      'share': instance.share,
      'is_verified': instance.isVerified,
      'personal_details_id': instance.personalDetailsId,
      'business_details_id': instance.businessDetailsId,
    };
