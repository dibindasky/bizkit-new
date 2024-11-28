// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemindersSuccessResponce _$RemindersSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    RemindersSuccessResponce(
      reminders: (json['data'] as List<dynamic>?)
          ?.map((e) => Reminder.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
      hasMore: json['has_more'] as bool?,
    );

Map<String, dynamic> _$RemindersSuccessResponceToJson(
        RemindersSuccessResponce instance) =>
    <String, dynamic>{
      'data': instance.reminders,
      'page': instance.page,
      'page_size': instance.pageSize,
      'has_more': instance.hasMore,
    };
