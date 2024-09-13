// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemindersSuccessResponce _$RemindersSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    RemindersSuccessResponce(
      reminders: (json['reminders'] as List<dynamic>?)
          ?.map((e) => Reminder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemindersSuccessResponceToJson(
        RemindersSuccessResponce instance) =>
    <String, dynamic>{
      'reminders': instance.reminders,
    };
