// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedTo _$AssignedToFromJson(Map<String, dynamic> json) => AssignedTo(
      user: json['user'] as String?,
      isAccepted: json['is_accepted'] as String?,
    );

Map<String, dynamic> _$AssignedToToJson(AssignedTo instance) =>
    <String, dynamic>{
      'user': instance.user,
      'is_accepted': instance.isAccepted,
    };