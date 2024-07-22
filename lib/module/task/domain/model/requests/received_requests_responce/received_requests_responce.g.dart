// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_requests_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceivedRequestsResponce _$ReceivedRequestsResponceFromJson(
        Map<String, dynamic> json) =>
    ReceivedRequestsResponce(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => ReceivedTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReceivedRequestsResponceToJson(
        ReceivedRequestsResponce instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
