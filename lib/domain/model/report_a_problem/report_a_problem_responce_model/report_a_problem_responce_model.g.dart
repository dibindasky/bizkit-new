// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_a_problem_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportAProblemResponceModel _$ReportAProblemResponceModelFromJson(
        Map<String, dynamic> json) =>
    ReportAProblemResponceModel(
      id: json['id'] as int?,
      label: json['label'] as String?,
      message: json['message'] as String?,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$ReportAProblemResponceModelToJson(
        ReportAProblemResponceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'message': instance.message,
      'user_id': instance.userId,
    };
