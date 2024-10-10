// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_quick_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateQuickTask _$UpdateQuickTaskFromJson(Map<String, dynamic> json) =>
    UpdateQuickTask(
      quickTaskId: json['quick_task_id'] as String?,
      assignedTo: (json['assigned_to'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UpdateQuickTaskToJson(UpdateQuickTask instance) =>
    <String, dynamic>{
      'quick_task_id': instance.quickTaskId,
      'assigned_to': instance.assignedTo,
    };
