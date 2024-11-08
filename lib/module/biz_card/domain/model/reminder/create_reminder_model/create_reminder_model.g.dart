// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReminderModel _$CreateReminderModelFromJson(Map<String, dynamic> json) =>
    CreateReminderModel(
      bizcardId: json['bizcard_id'] as String?,
      venue: json['venue'] as String?,
      occasion: json['occasion'] as String?,
      description: json['description'] as String?,
      reminderDate: json['reminder_date'] as String?,
      meetingLabel: json['meeting_label'] as String?,
    );

Map<String, dynamic> _$CreateReminderModelToJson(
        CreateReminderModel instance) =>
    <String, dynamic>{
      'bizcard_id': instance.bizcardId,
      'venue': instance.venue,
      'occasion': instance.occasion,
      'description': instance.description,
      'meeting_label': instance.meetingLabel,
      'reminder_date': instance.reminderDate,
    };
