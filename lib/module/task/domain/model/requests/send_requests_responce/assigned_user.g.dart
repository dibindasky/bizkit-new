// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedUser _$AssignedUserFromJson(Map<String, dynamic> json) => AssignedUser(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isAccepted: json['is_accepted'] as bool?,
    );

Map<String, dynamic> _$AssignedUserToJson(AssignedUser instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'is_accepted': instance.isAccepted,
    };
