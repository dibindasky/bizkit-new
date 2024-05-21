// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reminders _$RemindersFromJson(Map<String, dynamic> json) => Reminders(
      id: json['id'] as int?,
      meetingLabel: json['meeting_label'] as String?,
      message: json['message'] as String?,
      venue: json['venue'] as String?,
      occation: json['occation'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      archived: json['archived'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      userId: json['user_id'] as int?,
      cardHolderId: json['card_holder_id'] as int?,
      cardId: json['card_id'] as int?,
      connectionId: json['connection_id'] as int?,
    );

Map<String, dynamic> _$RemindersToJson(Reminders instance) => <String, dynamic>{
      'id': instance.id,
      'meeting_label': instance.meetingLabel,
      'message': instance.message,
      'venue': instance.venue,
      'name': instance.name,
      'image': instance.image,
      'occation': instance.occation,
      'date': instance.date,
      'time': instance.time,
      'archived': instance.archived,
      'created_at': instance.createdAt?.toIso8601String(),
      'user_id': instance.userId,
      'card_holder_id': instance.cardHolderId,
      'card_id': instance.cardId,
      'connection_id': instance.connectionId,
    };
