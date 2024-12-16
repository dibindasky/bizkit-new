// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_action_dates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllActionDates _$AllActionDatesFromJson(Map<String, dynamic> json) =>
    AllActionDates(
      date: json['date'] as String?,
      description: json['description'] as String?,
      byWhom: json['by_whom'] as String?,
    );

Map<String, dynamic> _$AllActionDatesToJson(AllActionDates instance) =>
    <String, dynamic>{
      'date': instance.date,
      'description': instance.description,
      'by_whom': instance.byWhom,
    };
