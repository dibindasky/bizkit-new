// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_reminders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryReminders _$HistoryRemindersFromJson(Map<String, dynamic> json) =>
    HistoryReminders(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      cardHolderId: json['card_holder_id'] as int?,
      cardId: json['card_id'] as int?,
      connectionId: json['connection_id'] as int?,
      meetingLabel: json['meeting_label'] as String?,
      message: json['message'] as String?,
      venue: json['venue'] as String?,
      occation: json['occation'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      isArchived: json['is_archived'] as bool?,
    );

Map<String, dynamic> _$HistoryRemindersToJson(HistoryReminders instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'card_holder_id': instance.cardHolderId,
      'card_id': instance.cardId,
      'connection_id': instance.connectionId,
      'meeting_label': instance.meetingLabel,
      'message': instance.message,
      'venue': instance.venue,
      'occation': instance.occation,
      'date': instance.date,
      'time': instance.time,
      'is_archived': instance.isArchived,
    };
