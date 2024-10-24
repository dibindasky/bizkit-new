// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BizCardUsers _$BizCardUsersFromJson(Map<String, dynamic> json) => BizCardUsers(
      userId: json['user_id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      designation: json['designation'] as String?,
      companyName: json['company_name'],
      profilePicture: json['profile_picture'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      connectionRequestId: json['connectionRequestId'] as String?,
      checkLoading: json['checkLoading'] as bool? ?? false,
      connectionExist: json['connection_exist'] as bool?,
    );

Map<String, dynamic> _$BizCardUsersToJson(BizCardUsers instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'designation': instance.designation,
      'company_name': instance.companyName,
      'profile_picture': instance.profilePicture,
      'bizcard_id': instance.bizcardId,
      'connection_exist': instance.connectionExist,
      'connectionRequestId': instance.connectionRequestId,
      'checkLoading': instance.checkLoading,
    };
