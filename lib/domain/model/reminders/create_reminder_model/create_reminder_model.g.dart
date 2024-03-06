// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReminderModel _$CreateReminderModelFromJson(Map<String, dynamic> json) =>
    CreateReminderModel(
      meetingLabel: json['meeting_label'] as String?,
      message: json['message'] as String?,
      venue: json['venue'] as String?,
      occation: json['occation'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      connectionId: json['connection_id'] as int?,
      cardId: json['card_id'] as int?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CreateReminderModelToJson(
        CreateReminderModel instance) =>
    <String, dynamic>{
      'meeting_label': instance.meetingLabel,
      'message': instance.message,
      'venue': instance.venue,
      'occation': instance.occation,
      'date': instance.date,
      'time': instance.time,
      'connection_id': instance.connectionId,
      'card_id': instance.cardId,
      'id': instance.id,
    };
