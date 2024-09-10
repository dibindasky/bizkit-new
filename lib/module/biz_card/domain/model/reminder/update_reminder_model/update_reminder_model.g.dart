// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReminderModel _$UpdateReminderModelFromJson(Map<String, dynamic> json) =>
    UpdateReminderModel(
      reminderId: json['reminder_id'] as String?,
      venue: json['venue'] as String?,
      occasion: json['occasion'] as String?,
      description: json['description'] as String?,
      reminderDate: json['reminder_date'] as String?,
    );

Map<String, dynamic> _$UpdateReminderModelToJson(
        UpdateReminderModel instance) =>
    <String, dynamic>{
      'reminder_id': instance.reminderId,
      'venue': instance.venue,
      'occasion': instance.occasion,
      'description': instance.description,
      'reminder_date': instance.reminderDate,
    };
