// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_or_killed_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedOrKilledSuccessResponce _$CompletedOrKilledSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    CompletedOrKilledSuccessResponce(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map(
              (e) => TasksCompletedOrKilled.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompletedOrKilledSuccessResponceToJson(
        CompletedOrKilledSuccessResponce instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
