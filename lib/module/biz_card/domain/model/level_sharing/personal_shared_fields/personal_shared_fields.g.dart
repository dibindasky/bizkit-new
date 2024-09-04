// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_shared_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalSharedFields _$PersonalSharedFieldsFromJson(
        Map<String, dynamic> json) =>
    PersonalSharedFields(
      name: json['name'] as bool?,
      email: json['email'] as bool?,
      phone: json['phone'] as bool?,
      personalAchievements: json['personal_achievements'] as bool?,
      personalSocialMedia: json['personal_social_media'] as bool?,
      dob: json['dob'] as bool?,
      bloodGroup: json['blood_group'] as bool?,
    );

Map<String, dynamic> _$PersonalSharedFieldsToJson(
        PersonalSharedFields instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'personal_achievements': instance.personalAchievements,
      'personal_social_media': instance.personalSocialMedia,
      'dob': instance.dob,
      'blood_group': instance.bloodGroup,
    };
