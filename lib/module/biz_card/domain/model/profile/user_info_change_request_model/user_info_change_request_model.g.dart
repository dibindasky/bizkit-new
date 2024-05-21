// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_change_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoChangeRequestModel _$UserInfoChangeRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserInfoChangeRequestModel(
      isActive: json['is_active'] as bool?,
      name: json['name'] as String?,
      profilePic: json['profile_pic'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$UserInfoChangeRequestModelToJson(
        UserInfoChangeRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_active': instance.isActive,
      'name': instance.name,
      'profile_pic': instance.profilePic,
    };
