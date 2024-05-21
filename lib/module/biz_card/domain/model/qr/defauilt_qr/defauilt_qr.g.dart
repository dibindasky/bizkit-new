// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defauilt_qr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefauiltQr _$DefauiltQrFromJson(Map<String, dynamic> json) => DefauiltQr(
      accolades: json['accolades'] as bool?,
      accreditation: json['accreditation'] as bool?,
      id: json['id'] as int?,
      email: json['email'] as bool?,
      phoneNumber: json['phone_number'] as bool?,
      personalSocialMedia: json['personal_social_media'] as bool?,
      address: json['address'] as bool?,
      company: json['company'] as bool?,
      businessEmail: json['business_email'] as bool?,
      socialMediaHandles: json['social_media_handles'] as bool?,
      websiteLink: json['website_link'] as bool?,
      businessDetailsMobileNumber:
          json['business_details_mobile_number'] as bool?,
      updateAllCards: json['update_all_cards'] as bool?,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$DefauiltQrToJson(DefauiltQr instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'personal_social_media': instance.personalSocialMedia,
      'address': instance.address,
      'company': instance.company,
      'business_email': instance.businessEmail,
      'accolades': instance.accolades,
      'accreditation': instance.accreditation,
      'social_media_handles': instance.socialMediaHandles,
      'website_link': instance.websiteLink,
      'business_details_mobile_number': instance.businessDetailsMobileNumber,
      'update_all_cards': instance.updateAllCards,
      'user_id': instance.userId,
    };
