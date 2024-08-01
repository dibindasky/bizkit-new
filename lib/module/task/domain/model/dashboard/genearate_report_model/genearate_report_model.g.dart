// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genearate_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenearateReportModel _$GenearateReportModelFromJson(
        Map<String, dynamic> json) =>
    GenearateReportModel(
      taskIds: (json['task_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fields:
          (json['fields'] as List<dynamic>?)?.map((e) => e as String).toList(),
      reportType: json['report_type'] as String?,
    );

Map<String, dynamic> _$GenearateReportModelToJson(
        GenearateReportModel instance) =>
    <String, dynamic>{
      'task_ids': instance.taskIds,
      'fields': instance.fields,
      'report_type': instance.reportType,
    };
