// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bizcard_single_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BizcardSingleNotification _$BizcardSingleNotificationFromJson(
        Map<String, dynamic> json) =>
    BizcardSingleNotification(
      type: json['type'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      createdAt: json['created_at'] as String,
      connectionId: json['connection_id'] as String?,
    );

Map<String, dynamic> _$BizcardSingleNotificationToJson(
        BizcardSingleNotification instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'bizcard_id': instance.bizcardId,
      'created_at': instance.createdAt,
      'connection_id': instance.connectionId,
    };
