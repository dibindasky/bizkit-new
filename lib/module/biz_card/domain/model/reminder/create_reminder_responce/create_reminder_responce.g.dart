// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reminder_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReminderResponce _$CreateReminderResponceFromJson(
        Map<String, dynamic> json) =>
    CreateReminderResponce(
      message: json['message'] as String?,
      reminderId: json['reminder_id'] as String?,
    );

Map<String, dynamic> _$CreateReminderResponceToJson(
        CreateReminderResponce instance) =>
    <String, dynamic>{
      'message': instance.message,
      'reminder_id': instance.reminderId,
    };
