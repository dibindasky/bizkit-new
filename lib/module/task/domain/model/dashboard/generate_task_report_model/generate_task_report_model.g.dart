// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_task_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateTaskReportModel _$GenerateTaskReportModelFromJson(
        Map<String, dynamic> json) =>
    GenerateTaskReportModel(
      taskMentionedType: (json['task_mentioned_type'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      taskType: (json['task_type'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      priorityLevel: (json['priority_level'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fromDate: json['from_date'] as String?,
      toDate: json['to_date'] as String?,
    );

Map<String, dynamic> _$GenerateTaskReportModelToJson(
        GenerateTaskReportModel instance) =>
    <String, dynamic>{
      'task_mentioned_type': instance.taskMentionedType,
      'task_type': instance.taskType,
      'priority_level': instance.priorityLevel,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
    };
