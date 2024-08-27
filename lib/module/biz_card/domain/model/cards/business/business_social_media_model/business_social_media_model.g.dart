// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_social_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessSocialMediaModel _$BusinessSocialMediaModelFromJson(
        Map<String, dynamic> json) =>
    BusinessSocialMediaModel(
      socialMediaId: json['social_media_id'] as String?,
      label: json['label'] as String?,
      link: json['link'] as String?,
      businessDetailsId: json['business_details_id'] as String?,
      bizcardId: json['bizcard_id'] as String?,
    );

Map<String, dynamic> _$BusinessSocialMediaModelToJson(
        BusinessSocialMediaModel instance) =>
    <String, dynamic>{
      'social_media_id': instance.socialMediaId,
      'label': instance.label,
      'link': instance.link,
      'business_details_id': instance.businessDetailsId,
      'bizcard_id': instance.bizcardId,
    };
