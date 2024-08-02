// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_user_from_assigned_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveUserFromAssignedModel _$RemoveUserFromAssignedModelFromJson(
        Map<String, dynamic> json) =>
    RemoveUserFromAssignedModel(
      taskId: json['task_id'] as String?,
      assignedTo: (json['assigned_to'] as List<dynamic>?)
          ?.map((e) => AssignedTo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoveUserFromAssignedModelToJson(
        RemoveUserFromAssignedModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'assigned_to': instance.assignedTo,
    };
