// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecievedConnectionRequest _$RecievedConnectionRequestFromJson(
        Map<String, dynamic> json) =>
    RecievedConnectionRequest(
      id: json['_id'] as String?,
      fromUser: json['from_user'] as String?,
      toUser: json['to_user'] as String?,
      toCard: json['to_card'] as String?,
      status: json['status'],
      sharedFields: json['shared_fields'] == null
          ? null
          : SharedFields.fromJson(
              json['shared_fields'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      fromUserName: json['from_user_name'] as String?,
      fromUserProfilePicture: json['from_user_profile_picture'] as String?,
      fromUserCompanyName: json['from_user_company_name'] as String?,
      fromUserDesignation: json['from_user_designation'] as String?,
    );

Map<String, dynamic> _$RecievedConnectionRequestToJson(
        RecievedConnectionRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'from_user': instance.fromUser,
      'to_user': instance.toUser,
      'to_card': instance.toCard,
      'status': instance.status,
      'shared_fields': instance.sharedFields,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'from_user_name': instance.fromUserName,
      'from_user_profile_picture': instance.fromUserProfilePicture,
      'from_user_company_name': instance.fromUserCompanyName,
      'from_user_designation': instance.fromUserDesignation,
    };
