// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedSubTasks _$SubTaskFromJson(Map<String, dynamic> json) =>
    CompletedSubTasks(
      title: json['title'] as String?,
      description: json['description'] as String?,
      isCompleted: json['is_completed'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : json['created_at'] as String,
      id: json['_id'] as String?,
      totalTimeTaken: json['total_time_taken'] as String?,
      duration: json['duration'] as String?,
    );

Map<String, dynamic> _$SubTaskToJson(CompletedSubTasks instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'is_completed': instance.isCompleted,
      'created_at': instance.createdAt,
      '_id': instance.id,
      'total_time_taken': instance.totalTimeTaken,
      'duration': instance.duration,
    };
