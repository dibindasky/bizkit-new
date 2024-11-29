// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biz_card_reminders_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BizCardRemindersResponce _$BizCardRemindersResponceFromJson(
        Map<String, dynamic> json) =>
    BizCardRemindersResponce(
      reminders: (json['reminders'] as List<dynamic>?)
          ?.map((e) => BizCardReminder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BizCardRemindersResponceToJson(
        BizCardRemindersResponce instance) =>
    <String, dynamic>{
      'reminders': instance.reminders,
    };
