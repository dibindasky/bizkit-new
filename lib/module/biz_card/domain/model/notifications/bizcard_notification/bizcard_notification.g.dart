// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bizcard_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BizcardNotification _$BizcardNotificationFromJson(Map<String, dynamic> json) =>
    BizcardNotification(
      id: json['_id'] as String?,
      userId: json['user_id'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      isRead: json['is_read'] as bool?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      notificationType: json['notification_type'] as String?,
      connectionId: json['connection_id'] as String?,
    );

Map<String, dynamic> _$BizcardNotificationToJson(
        BizcardNotification instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'bizcard_id': instance.bizcardId,
      'title': instance.title,
      'message': instance.message,
      'is_read': instance.isRead,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'notification_type': instance.notificationType,
      'connection_id': instance.connectionId,
    };
