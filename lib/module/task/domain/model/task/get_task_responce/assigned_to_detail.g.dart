// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_to_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedToDetail _$AssignedToDetailFromJson(Map<String, dynamic> json) =>
    AssignedToDetail(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      isAccepted: json['is_accepted'] as bool?,
    );

Map<String, dynamic> _$AssignedToDetailToJson(AssignedToDetail instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'is_accepted': instance.isAccepted,
    };
