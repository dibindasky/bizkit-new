// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_connection_requets_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendConnectionRequetsResponce _$SendConnectionRequetsResponceFromJson(
        Map<String, dynamic> json) =>
    SendConnectionRequetsResponce(
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => SendConnectionRequet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SendConnectionRequetsResponceToJson(
        SendConnectionRequetsResponce instance) =>
    <String, dynamic>{
      'requests': instance.requests,
    };
