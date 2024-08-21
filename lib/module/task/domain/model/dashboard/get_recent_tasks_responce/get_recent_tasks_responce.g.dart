// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recent_tasks_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecentTasksResponce _$GetRecentTasksResponceFromJson(
        Map<String, dynamic> json) =>
    GetRecentTasksResponce(
      selfToSelf: (json['self_to_self'] as List<dynamic>?)
          ?.map((e) => RecentTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
      selfToOthers: (json['self_to_others'] as List<dynamic>?)
          ?.map((e) => RecentTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
      othersToSelf: (json['others_to_self'] as List<dynamic>?)
          ?.map((e) => RecentTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRecentTasksResponceToJson(
        GetRecentTasksResponce instance) =>
    <String, dynamic>{
      'self_to_self': instance.selfToSelf,
      'self_to_others': instance.selfToOthers,
      'others_to_self': instance.othersToSelf,
    };
