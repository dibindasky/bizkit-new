// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_qr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateQrModel _$CreateQrModelFromJson(Map<String, dynamic> json) =>
    CreateQrModel(
      email: json['email'] as bool?,
      phoneNumber: json['phone_number'] as bool?,
      company: json['company'] as bool?,
      personalSocialMedia: json['personal_social_media'] as bool?,
      businessDetailsEmail: json['business_details_email'] as bool?,
      businessDetailsMobileNumber:
          json['business_details_mobile_number'] as bool?,
      address: json['address'] as bool?,
      socialMediaHandles: json['social_media_handles'] as bool?,
      websiteLink: json['website_link'] as bool?,
      card: json['card'] as int?,
      businessEmail: json['business_email'] as bool?,
    );

Map<String, dynamic> _$CreateQrModelToJson(CreateQrModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'company': instance.company,
      'personal_social_media': instance.personalSocialMedia,
      'business_details_email': instance.businessDetailsEmail,
      'business_details_mobile_number': instance.businessDetailsMobileNumber,
      'address': instance.address,
      'social_media_handles': instance.socialMediaHandles,
      'website_link': instance.websiteLink,
      'business_email': instance.businessEmail,
      'card': instance.card,
    };
