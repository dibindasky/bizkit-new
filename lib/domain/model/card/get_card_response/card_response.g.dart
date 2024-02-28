// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardResponse _$CardResponseFromJson(Map<String, dynamic> json) => CardResponse(
      id: json['id'] as int?,
      logo: json['logo'] as String?,
      isDefault: json['is_default'] as bool?,
      isArchived: json['is_archived'] as bool?,
      userId: json['user_id'] as int?,
      personalDetails: json['personal_details_id'] as int?,
      businessDetails: json['business_details_id'] as int?,
      cardLink: json['card_link'] as String?,
      company: json['company'] as String?,
      designation: json['designation'] as String?,
      isVerified: json['is_verified'] as bool?,
      share: json['share'] as int?,
      views: json['views'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CardResponseToJson(CardResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card_link': instance.cardLink,
      'logo': instance.logo,
      'name': instance.name,
      'is_default': instance.isDefault,
      'is_archived': instance.isArchived,
      'is_verified': instance.isVerified,
      'views': instance.views,
      'share': instance.share,
      'user_id': instance.userId,
      'designation': instance.designation,
      'company': instance.company,
      'personal_details_id': instance.personalDetails,
      'business_details_id': instance.businessDetails,
    };
