// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      profilePicture: json['profile_picture'],
    );

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'profile_picture': instance.profilePicture,
    };
