// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuickTasks _$QuickTasksFromJson(Map<String, dynamic> json) => QuickTasks(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      assignedTo: (json['assigned_to'] as List<dynamic>?)
          ?.map((e) => AssignedTo.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCompleted: json['is_completed'] as bool?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      completedBy: (json['completed_by'] as List<dynamic>?)
          ?.map((e) => CompletedBy.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedAt: json['completed_at'] as String?,
      isOwned: json['is_owned'] as bool?,
    );

Map<String, dynamic> _$QuickTasksToJson(QuickTasks instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'assigned_to': instance.assignedTo,
      'is_completed': instance.isCompleted,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
      'completed_by': instance.completedBy,
      'completed_at': instance.completedAt,
      'is_owned': instance.isOwned,
    };
