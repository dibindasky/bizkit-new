// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_connection_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendConnectionResponce _$SendConnectionResponceFromJson(
        Map<String, dynamic> json) =>
    SendConnectionResponce(
      message: json['message'] as String?,
      connectionRequestId: json['connection_request_id'] as String?,
    );

Map<String, dynamic> _$SendConnectionResponceToJson(
        SendConnectionResponce instance) =>
    <String, dynamic>{
      'message': instance.message,
      'connection_request_id': instance.connectionRequestId,
    };
