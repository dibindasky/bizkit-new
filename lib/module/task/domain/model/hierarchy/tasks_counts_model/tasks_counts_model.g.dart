// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_counts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmpolyeesTasksCountsModel _$EmpolyeesTasksCountsModelFromJson(
        Map<String, dynamic> json) =>
    EmpolyeesTasksCountsModel(
      userIds: (json['user_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$EmpolyeesTasksCountsModelToJson(
        EmpolyeesTasksCountsModel instance) =>
    <String, dynamic>{
      'user_ids': instance.userIds,
    };
