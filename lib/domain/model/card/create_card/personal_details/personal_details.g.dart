// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalDetailsCreate _$PersonalDetailsCreateFromJson(
        Map<String, dynamic> json) =>
    PersonalDetailsCreate(
      accolades: (json['accolades_id'] as List<dynamic>?)
          ?.map((e) => AccoladeCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
      personalSocialMedia: (json['personal_social_media_id'] as List<dynamic>?)
          ?.map((e) =>
              SocialMediaHandleCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
      datesToRemember: (json['dates_to_remember_id'] as List<dynamic>?)
          ?.map(
              (e) => DatesToRememberCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos: json['photos'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      designation: json['designation'] as String?,
      businessCategory: json['business_category_id'] as int?,
      homeAddress: json['home_address'] as String?,
      bloodGroup: json['blood_group'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
    );

Map<String, dynamic> _$PersonalDetailsCreateToJson(
        PersonalDetailsCreate instance) =>
    <String, dynamic>{
      'accolades_id': instance.accolades,
      'personal_social_media_id': instance.personalSocialMedia,
      'dates_to_remember_id': instance.datesToRemember,
      'photos': instance.photos,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'designation': instance.designation,
      'business_category_id': instance.businessCategory,
      'home_address': instance.homeAddress,
      'blood_group': instance.bloodGroup,
      'date_of_birth': instance.dateOfBirth,
    };
