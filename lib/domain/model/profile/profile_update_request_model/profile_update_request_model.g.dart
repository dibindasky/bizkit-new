// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUpdateRequestModel _$ProfileUpdateRequestModelFromJson(
        Map<String, dynamic> json) =>
    ProfileUpdateRequestModel(
      name: json['name'] as String?,
      profilePic: json['profile_pic'] as String?,
    );

Map<String, dynamic> _$ProfileUpdateRequestModelToJson(
        ProfileUpdateRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_pic': instance.profilePic,
    };
