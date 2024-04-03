// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalDetails _$PersonalDetailsFromJson(Map<String, dynamic> json) =>
    PersonalDetails(
      id: json['id'] as int?,
      photos: json['photos'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      company: json['company'] as String?,
      businessCategory: json['business_category'] == null
          ? null
          : BusinessCategoryCard.fromJson(
              json['business_category'] as Map<String, dynamic>),
      homeAddress: json['home_address'] as String?,
      bloodGroup: json['blood_group'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
    )
      ..businessCategoryId = json['business_category_id'] as int?
      ..designation = json['designation'] as String?;

Map<String, dynamic> _$PersonalDetailsToJson(PersonalDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photos': instance.photos,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'company': instance.company,
      'business_category': instance.businessCategory,
      'business_category_id': instance.businessCategoryId,
      'home_address': instance.homeAddress,
      'blood_group': instance.bloodGroup,
      'date_of_birth': instance.dateOfBirth,
      'designation': instance.designation,
    };
