// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubTasks _$SubTasksFromJson(Map<String, dynamic> json) => SubTasks(
      title: json['title'] as String?,
      description: json['description'] as String?,
      deadLine: json['dead_line'] as String?,
      isCompleted: json['is_completed'] as bool?,
      totalTimeTaken: json['total_time_taken'] as String?,
    );

Map<String, dynamic> _$SubTasksToJson(SubTasks instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'dead_line': instance.deadLine,
      'is_completed': instance.isCompleted,
      'total_time_taken': instance.totalTimeTaken,
    };
