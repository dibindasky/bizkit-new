// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedTo _$AssignedToFromJson(Map<String, dynamic> json) => AssignedTo(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      profilePicture: json['profile_picture'],
    );

Map<String, dynamic> _$AssignedToToJson(AssignedTo instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'profile_picture': instance.profilePicture,
    };
