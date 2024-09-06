// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recieved_connection_requests_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecievedConnectionRequestsResponce _$RecievedConnectionRequestsResponceFromJson(
        Map<String, dynamic> json) =>
    RecievedConnectionRequestsResponce(
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) =>
              RecievedConnectionRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecievedConnectionRequestsResponceToJson(
        RecievedConnectionRequestsResponce instance) =>
    <String, dynamic>{
      'requests': instance.requests,
    };
