// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitLog _$VisitLogFromJson(Map<String, dynamic> json) => VisitLog(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilePicture: json['profile_picture'] as String?,
      designation: json['designation'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$VisitLogToJson(VisitLog instance) => <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'profile_picture': instance.profilePicture,
      'designation': instance.designation,
      'time': instance.time,
    };
