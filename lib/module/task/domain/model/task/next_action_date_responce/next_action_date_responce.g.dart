// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_action_date_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextActionDateResponce _$NextActionDateResponceFromJson(
        Map<String, dynamic> json) =>
    NextActionDateResponce(
      userName: json['user_name'] as String?,
      userEmail: json['user_email'] as String?,
      userProfile: json['user_profile'],
      userId: json['user_id'] as String?,
      date: json['date'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$NextActionDateResponceToJson(
        NextActionDateResponce instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'user_profile': instance.userProfile,
      'user_id': instance.userId,
      'date': instance.date,
      'description': instance.description,
    };
