// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_assined_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewAssinedUsersModel _$AddNewAssinedUsersModelFromJson(
        Map<String, dynamic> json) =>
    AddNewAssinedUsersModel(
      taskId: json['task_id'] as String?,
      assignedTo: (json['assigned_to'] as List<dynamic>?)
          ?.map((e) => AssignedToDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddNewAssinedUsersModelToJson(
        AddNewAssinedUsersModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'assigned_to': instance.assignedTo,
    };
