// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_requests_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendRequestsResponce _$SendRequestsResponceFromJson(
        Map<String, dynamic> json) =>
    SendRequestsResponce(
      sentRequests: (json['sent_requests'] as List<dynamic>?)
          ?.map((e) => SentRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SendRequestsResponceToJson(
        SendRequestsResponce instance) =>
    <String, dynamic>{
      'sent_requests': instance.sentRequests,
    };
