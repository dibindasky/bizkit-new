// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_social_media_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalSocialMediaRequestModel _$PersonalSocialMediaRequestModelFromJson(
        Map<String, dynamic> json) =>
    PersonalSocialMediaRequestModel(
      label: json['label'] as String?,
      link: json['link'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      socialMediaId: json['social_media_id'] as String?,
      personalDetailsId: json['personal_details_id'] as String?,
    );

Map<String, dynamic> _$PersonalSocialMediaRequestModelToJson(
        PersonalSocialMediaRequestModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'link': instance.link,
      'bizcard_id': instance.bizcardId,
      'personal_details_id': instance.personalDetailsId,
      'social_media_id': instance.socialMediaId,
    };
