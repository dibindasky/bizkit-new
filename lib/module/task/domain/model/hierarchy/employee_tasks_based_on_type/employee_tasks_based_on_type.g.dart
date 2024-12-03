// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_tasks_based_on_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeTasksBasedOnType _$EmployeeTasksBasedOnTypeFromJson(
        Map<String, dynamic> json) =>
    EmployeeTasksBasedOnType(
      targetUserId: json['target_user_id'] as String?,
      taskType: json['task_type'] as String?,
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$EmployeeTasksBasedOnTypeToJson(
        EmployeeTasksBasedOnType instance) =>
    <String, dynamic>{
      'target_user_id': instance.targetUserId,
      'task_type': instance.taskType,
      'page': instance.page,
      'page_size': instance.pageSize,
    };
