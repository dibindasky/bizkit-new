// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuickTaskAssignedToResponce _$AssignedToFromJson(Map<String, dynamic> json) =>
    QuickTaskAssignedToResponce(
        userId: json['user_id'] as String?,
        name: json['name'] as String?,
        profilePicture: json['profile_picture'] as String?,
        status: json['status'] as String?);

Map<String, dynamic> _$AssignedToToJson(QuickTaskAssignedToResponce instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'profile_picture': instance.profilePicture,
      'status': instance.status
    };
