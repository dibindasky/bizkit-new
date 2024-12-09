// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_task_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTaskResponce _$GetTaskResponceFromJson(Map<String, dynamic> json) =>
    GetTaskResponce(
      id: json['_id'] as String?,
      createdBy: json['created_by'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      priorityLevel: json['priority_level'] as String?,
      recurrentTask: json['recurrent_task'] as bool?,
      isCompleted: json['is_completed'] as bool?,
      deadLine: json['dead_line'] as String?,
      isKilled: json['is_killed'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTask: (json['sub_task'] as List<dynamic>?)
          ?.map((e) => SubTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      status: json['status'] as String?,
      isOwned: json['is_owned'] as bool?,
      assignedToDetails: (json['assigned_to_details'] as List<dynamic>?)
          ?.map((e) => AssignedToDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalExpense: json['total_expense'] as int?,
      totalTime: json['total_time'] as int?,
      createdUserDetails: json['created_user_details'] == null
          ? null
          : CreatedUserDetails.fromJson(
              json['created_user_details'] as Map<String, dynamic>),
      recentVisitLogs: (json['recent_visit_logs'] as List<dynamic>?)
          ?.map((e) => RecentVisitLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      visitLogs: (json['visit_logs'] as List<dynamic>?)
          ?.map((e) => VisitLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextActionDate: (json['next_action_date'] as List<dynamic>?)
          ?.map(
              (e) => NextActionDateResponce.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updated_at'] as String?,
      updatedField: json['updated_field'] as String?,
    )
      ..localId = json['localId'] as int?
      ..taskType = json['taskType'] as String?
      ..spotlightOn = json['spotlightOn'] as bool?
      ..isPinned = json['isPinned'] as bool?;

Map<String, dynamic> _$GetTaskResponceToJson(GetTaskResponce instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'taskType': instance.taskType,
      'spotlightOn': instance.spotlightOn,
      'isPinned': instance.isPinned,
      '_id': instance.id,
      'created_by': instance.createdBy,
      'title': instance.title,
      'description': instance.description,
      'priority_level': instance.priorityLevel,
      'recurrent_task': instance.recurrentTask,
      'is_completed': instance.isCompleted,
      'is_owned': instance.isOwned,
      'dead_line': instance.deadLine,
      'is_killed': instance.isKilled,
      'tags': instance.tags,
      'attachments': instance.attachments,
      'sub_task': instance.subTask,
      'created_at': instance.createdAt,
      'status': instance.status,
      'created_user_details': instance.createdUserDetails,
      'assigned_to_details': instance.assignedToDetails,
      'total_time': instance.totalTime,
      'total_expense': instance.totalExpense,
      'recent_visit_logs': instance.recentVisitLogs,
      'next_action_date': instance.nextActionDate,
      'visit_logs': instance.visitLogs,
      'updated_at': instance.updatedAt,
      'updated_field': instance.updatedField,
    };
