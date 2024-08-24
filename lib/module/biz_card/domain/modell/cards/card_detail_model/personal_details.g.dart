// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalDetails _$PersonalDetailsFromJson(Map<String, dynamic> json) =>
    PersonalDetails(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
      address: json['address'] as String?,
      bloodGroup: json['blood_group'] as String?,
      dob: json['dob'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      personalAchievements: (json['personal_achievements'] as List<dynamic>?)
          ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList(),
      personalSocialMedia: (json['personal_social_media'] as List<dynamic>?)
          ?.map((e) => PersonalSocialMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      datesToRemember: (json['dates_to_remember'] as List<dynamic>?)
          ?.map((e) => DatesToRemember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonalDetailsToJson(PersonalDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'blood_group': instance.bloodGroup,
      'dob': instance.dob,
      'images': instance.images,
      'personal_achievements': instance.personalAchievements,
      'personal_social_media': instance.personalSocialMedia,
      'dates_to_remember': instance.datesToRemember,
    };
