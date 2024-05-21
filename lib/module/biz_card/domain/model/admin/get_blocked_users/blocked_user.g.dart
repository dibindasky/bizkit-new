// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockedDUser _$BlockedDUserFromJson(Map<String, dynamic> json) => BlockedDUser(
      id: json['id'] as int?,
      name: json['name'] as String?,
      profilePic: json['profile_pic'] as String?,
      userId: json['user_id'] as int?,
      companyId: json['company_id'] as int?,
    );

Map<String, dynamic> _$BlockedDUserToJson(BlockedDUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_pic': instance.profilePic,
      'user_id': instance.userId,
      'company_id': instance.companyId,
    };
