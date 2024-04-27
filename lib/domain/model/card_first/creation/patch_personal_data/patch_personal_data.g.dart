// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_personal_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchPersonalData _$PatchPersonalDataFromJson(Map<String, dynamic> json) =>
    PatchPersonalData(
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      designation: json['designation'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      bloodGroup: json['blood_group'] as String?,
      homeAddress: json['home_address'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PersonalPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessCategoryId: json['business_category_id'] as int?,
    );

Map<String, dynamic> _$PatchPersonalDataToJson(PatchPersonalData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'designation': instance.designation,
      'date_of_birth': instance.dateOfBirth,
      'blood_group': instance.bloodGroup,
      'home_address': instance.homeAddress,
      'photos': instance.photos,
      'business_category_id': instance.businessCategoryId,
    };
