// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubTasks _$SubTasksFromJson(Map<String, dynamic> json) => SubTasks(
      title: json['title'] as String?,
      description: json['description'] as String?,
      isCompleted: json['is_completed'] as bool?,
    );

Map<String, dynamic> _$SubTasksToJson(SubTasks instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'is_completed': instance.isCompleted,
    };
