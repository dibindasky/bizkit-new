// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportTask _$ReportTaskFromJson(Map<String, dynamic> json) => ReportTask(
      taskId: json['task_id'] as String?,
      taskTitle: json['task_title'] as String?,
      createdBy: json['created_by'] as String?,
      deadLine: json['dead_line'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ReportTaskToJson(ReportTask instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'task_title': instance.taskTitle,
      'created_by': instance.createdBy,
      'dead_line': instance.deadLine,
      'status': instance.status,
    };
