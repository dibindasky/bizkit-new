// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subtask _$SubtaskFromJson(Map<String, dynamic> json) => Subtask(
      title: json['title'] as String?,
      description: json['description'] as String?,
      deadLine: json['dead_line'] as String?,
      isCompleted: json['is_completed'] as bool?,
      totalTimeTaken: json['total_time_taken'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$SubtaskToJson(Subtask instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'dead_line': instance.deadLine,
      'is_completed': instance.isCompleted,
      'total_time_taken': instance.totalTimeTaken,
      '_id': instance.id,
    };
