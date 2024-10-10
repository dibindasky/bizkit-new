// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_by.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedBy _$CompletedByFromJson(Map<String, dynamic> json) => CompletedBy(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      profilePicture: json['profile_picture'],
    );

Map<String, dynamic> _$CompletedByToJson(CompletedBy instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'profile_picture': instance.profilePicture,
    };
