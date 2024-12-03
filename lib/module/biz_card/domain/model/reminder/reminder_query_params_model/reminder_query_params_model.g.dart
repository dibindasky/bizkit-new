// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_query_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderQueryParamsModel _$ReminderQueryParamsModelFromJson(
        Map<String, dynamic> json) =>
    ReminderQueryParamsModel(
      category: json['category'] as String?,
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$ReminderQueryParamsModelToJson(
        ReminderQueryParamsModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'page': instance.page,
      'page_size': instance.pageSize,
    };
