// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reminder _$ReminderFromJson(Map<String, dynamic> json) => Reminder(
    id: json['_id'] as String?,
    userId: json['user_id'] as String?,
    cardId: json['card_id'] as String?,
    venue: json['venue'] as String?,
    occasion: json['occasion'] as String?,
    reminderDate: json['reminder_date'] as String?,
    profilePicture: json['profile_picture'] as String?,
    description: json['description'] as String?,
    meetingLabel: json['meeting_label'] as String?,
    ownerName: json['owner_name'] as String?,
    reminderId: json['reminder_id'] as String?);

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'card_id': instance.cardId,
      'venue': instance.venue,
      'occasion': instance.occasion,
      'reminder_date': instance.reminderDate,
      'profile_picture': instance.profilePicture,
      'description': instance.description,
      'meeting_label': instance.meetingLabel,
      'owner_name': instance.ownerName,
      'reminder_id': instance.reminderId,
    };
