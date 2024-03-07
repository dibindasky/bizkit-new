// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReminderModel _$GetReminderModelFromJson(Map<String, dynamic> json) =>
    GetReminderModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Reminders.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetReminderModelToJson(GetReminderModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
