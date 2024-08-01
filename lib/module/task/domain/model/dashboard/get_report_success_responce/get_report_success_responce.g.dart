// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_report_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReportSuccessResponce _$GetReportSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    GetReportSuccessResponce(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => ReportTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetReportSuccessResponceToJson(
        GetReportSuccessResponce instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
