// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_expense_and_time_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskExpenseAndTimeSuccessResponce _$TaskExpenseAndTimeSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    TaskExpenseAndTimeSuccessResponce(
      totalTime: (json['total_time'] as num?)?.toInt(),
      totalExpense: (json['total_expense'] as num?)?.toInt(),
      name: json['name'] as String?,
      profilePicture: json['profile_picture'] as String?,
    );

Map<String, dynamic> _$TaskExpenseAndTimeSuccessResponceToJson(
        TaskExpenseAndTimeSuccessResponce instance) =>
    <String, dynamic>{
      'total_time': instance.totalTime,
      'total_expense': instance.totalExpense,
      'name': instance.name,
      'profile_picture': instance.profilePicture,
    };