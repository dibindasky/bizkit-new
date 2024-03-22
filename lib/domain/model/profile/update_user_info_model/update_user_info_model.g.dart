// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInfoModel _$UpdateUserInfoModelFromJson(Map<String, dynamic> json) =>
    UpdateUserInfoModel(
      isActive: json['is_active'] as bool?,
      name: json['name'] as String?,
      profilePic: json['profile_pic'] as String?,
    );

Map<String, dynamic> _$UpdateUserInfoModelToJson(
        UpdateUserInfoModel instance) =>
    <String, dynamic>{
      'is_active': instance.isActive,
      'name': instance.name,
      'profile_pic': instance.profilePic,
    };
