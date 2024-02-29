// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QRModel _$QRModelFromJson(Map<String, dynamic> json) => QRModel(
      id: json['id'] as int?,
      logo: json['logo'] as String?,
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
      qrlink: json['qr_image_link'] as String?,
      cardId: json['card_id'] as int?,
      userId: json['user_id'] as int?,
      qrCode: json['qr_code'] as String?,
      businessEmail: json['business_email'] as bool?,
    );

Map<String, dynamic> _$QRModelToJson(QRModel instance) => <String, dynamic>{
      'id': instance.id,
      'logo': instance.logo,
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
      'qr_image_link': instance.qrlink,
      'qr_code': instance.qrCode,
      'card_id': instance.cardId,
      'user_id': instance.userId,
    };
