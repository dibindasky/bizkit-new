// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_dayes_to_reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalDayesToReminderModel _$PersonalDayesToReminderModelFromJson(
        Map<String, dynamic> json) =>
    PersonalDayesToReminderModel(
      date: json['date'] as String?,
      description: json['description'] as String?,
      dateId: json['date_id'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      personalDetailsId: json['personal_details_id'] as String?,
    );

Map<String, dynamic> _$PersonalDayesToReminderModelToJson(
        PersonalDayesToReminderModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'description': instance.description,
      'bizcard_id': instance.bizcardId,
      'personal_details_id': instance.personalDetailsId,
      'date_id': instance.dateId,
    };
