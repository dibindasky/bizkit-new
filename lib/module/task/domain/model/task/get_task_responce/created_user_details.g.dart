// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedUserDetails _$CreatedUserDetailsFromJson(Map<String, dynamic> json) =>
    CreatedUserDetails(
      id: json['id'] as String?,
      name: json['name'] as String?,
      profilePicture: json['profile_picture'] as String?,
    );

Map<String, dynamic> _$CreatedUserDetailsToJson(CreatedUserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_picture': instance.profilePicture,
    };
