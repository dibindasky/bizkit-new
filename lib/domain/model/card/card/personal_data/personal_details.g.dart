// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalDetails _$PersonalDetailsFromJson(Map<String, dynamic> json) =>
    PersonalDetails(
      id: json['id'] as int?,
      accolades: (json['accolades'] as List<dynamic>?)
          ?.map((e) => Accolade.fromJson(e as Map<String, dynamic>))
          .toList(),
      personalSocialMedia: (json['personal_social_media'] as List<dynamic>?)
          ?.map((e) => SocialMediaHandle.fromJson(e as Map<String, dynamic>))
          .toList(),
      datesToRemember: (json['dates_to_remember'] as List<dynamic>?)
          ?.map((e) => DatesToRemember.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      company: json['company'] as String?,
      businessCategory: json['business_category'] as String?,
      homeAddress: json['home_address'] as String?,
      bloodGroup: json['blood_group'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
    );

Map<String, dynamic> _$PersonalDetailsToJson(PersonalDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accolades': instance.accolades,
      'personal_social_media': instance.personalSocialMedia,
      'dates_to_remember': instance.datesToRemember,
      'photos': instance.photos,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'company': instance.company,
      'business_category': instance.businessCategory,
      'home_address': instance.homeAddress,
      'blood_group': instance.bloodGroup,
      'date_of_birth': instance.dateOfBirth,
    };
