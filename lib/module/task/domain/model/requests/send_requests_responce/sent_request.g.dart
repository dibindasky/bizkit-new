// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SentRequest _$SentRequestFromJson(Map<String, dynamic> json) => SentRequest(
      taskId: json['task_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      assignedUsers: (json['assigned_users'] as List<dynamic>?)
          ?.map((e) => AssignedUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$SentRequestToJson(SentRequest instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'title': instance.title,
      'description': instance.description,
      'assigned_users': instance.assignedUsers,
      'created_at': instance.createdAt,
    };
