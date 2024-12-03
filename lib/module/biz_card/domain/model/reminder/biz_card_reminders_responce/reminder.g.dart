// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BizCardReminder _$BizCardReminderFromJson(Map<String, dynamic> json) =>
    BizCardReminder(
      reminderId: json['reminder_id'] as String?,
      reminderDate: json['reminder_date'] as String?,
      description: json['description'] as String?,
      venue: json['venue'] as String?,
      occasion: json['occasion'] as String?,
      meetingLabel: json['meeting_label'] as String?,
    );

Map<String, dynamic> _$BizCardReminderToJson(BizCardReminder instance) =>
    <String, dynamic>{
      'reminder_id': instance.reminderId,
      'reminder_date': instance.reminderDate,
      'description': instance.description,
      'venue': instance.venue,
      'occasion': instance.occasion,
      'meeting_label': instance.meetingLabel,
    };
