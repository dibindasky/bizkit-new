// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_qrmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultQrmodel _$DefaultQrmodelFromJson(Map<String, dynamic> json) =>
    DefaultQrmodel(
      id: json['id'] as int?,
      email: json['email'] as bool?,
      phoneNumber: json['phone_number'] as bool?,
      company: json['company'] as bool?,
      personalSocialMedia: json['personal_social_media'] as bool?,
      businessDetailsMobileNumber:
          json['business_details_mobile_number'] as bool?,
      address: json['address'] as bool?,
      socialMediaHandles: json['social_media_handles'] as bool?,
      websiteLink: json['website_link'] as bool?,
      userId: json['user_id'] as int?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$DefaultQrmodelToJson(DefaultQrmodel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'company': instance.company,
      'personal_social_media': instance.personalSocialMedia,
      'business_details_mobile_number': instance.businessDetailsMobileNumber,
      'address': instance.address,
      'social_media_handles': instance.socialMediaHandles,
      'website_link': instance.websiteLink,
      'user_id': instance.userId,
      'card_id': instance.cardId,
    };
