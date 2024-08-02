// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_user_to_assgin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewUserToAssginModel _$AddNewUserToAssginModelFromJson(
        Map<String, dynamic> json) =>
    AddNewUserToAssginModel(
      taskId: json['task_id'] as String?,
      assignedTo: (json['assigned_to'] as List<dynamic>?)
          ?.map((e) => AssignedTo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddNewUserToAssginModelToJson(
        AddNewUserToAssginModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'assigned_to': instance.assignedTo,
    };
