// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      tag: json['tag'] as String?,
      specificId: json['specific_id'] as int?,
      scheduledAt: json['scheduled_at'] as String?,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'tag': instance.tag,
      'specific_id': instance.specificId,
      'scheduled_at': instance.scheduledAt,
      'user_id': instance.userId,
    };
