// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_to_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedToDetail _$AssignedToDetailFromJson(Map<String, dynamic> json) =>
    AssignedToDetail(
      userId: json['user'] as String?,
      name: json['name'] as String?,
      isAccepted: json['is_accepted'] as String?,
    )..localId = json['localId'] as int?;

Map<String, dynamic> _$AssignedToDetailToJson(AssignedToDetail instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'user': instance.userId,
      'name': instance.name,
      'is_accepted': instance.isAccepted,
    };
