// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearchSuccessResponce _$UserSearchSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    UserSearchSuccessResponce(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      photo: json['photo'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$UserSearchSuccessResponceToJson(
        UserSearchSuccessResponce instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'photo': instance.photo,
      'count': instance.count,
    };
