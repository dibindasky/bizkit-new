// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendConnectionRequet _$SendConnectionRequetFromJson(
        Map<String, dynamic> json) =>
    SendConnectionRequet(
      requestId: json['request_id'] as String?,
      toUserId: json['to_user_id'] as String?,
      toUserName: json['to_user_name'] as String?,
      toUserProfilePicture: json['to_user_profile_picture'] as String?,
      fromUserId: json['from_user_id'] as String?,
      fromCardId: json['from_card_id'] as String?,
    );

Map<String, dynamic> _$SendConnectionRequetToJson(
        SendConnectionRequet instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'to_user_id': instance.toUserId,
      'to_user_name': instance.toUserName,
      'to_user_profile_picture': instance.toUserProfilePicture,
      'from_user_id': instance.fromUserId,
      'from_card_id': instance.fromCardId,
    };
