// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskAssignedTo _$TaskAssignedToFromJson(Map<String, dynamic> json) =>
    TaskAssignedTo(
      user: json['user'] as String?,
      isAccepted: json['is_accepted'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TaskAssignedToToJson(TaskAssignedTo instance) =>
    <String, dynamic>{
      'user': instance.user,
      'is_accepted': instance.isAccepted,
      'name': instance.name,
    };
