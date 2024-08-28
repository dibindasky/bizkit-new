// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalDetailsRequestModel _$PersonalDetailsRequestModelFromJson(
        Map<String, dynamic> json) =>
    PersonalDetailsRequestModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
      address: json['address'] as String?,
      dob: json['dob'] as String?,
      bloodGroup: json['blood_group'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      bizcardId: json['bizcard_id'] as String?,
      personalDetailsId: json['personal_details_id'] as String?,
    );

Map<String, dynamic> _$PersonalDetailsRequestModelToJson(
        PersonalDetailsRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'dob': instance.dob,
      'blood_group': instance.bloodGroup,
      'images': instance.images,
      'bizcard_id': instance.bizcardId,
      'personal_details_id': instance.personalDetailsId,
    };
