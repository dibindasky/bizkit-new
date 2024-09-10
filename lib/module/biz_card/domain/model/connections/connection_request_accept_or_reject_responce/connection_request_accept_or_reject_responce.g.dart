// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_request_accept_or_reject_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionRequestAcceptOrRejectResponce
    _$ConnectionRequestAcceptOrRejectResponceFromJson(
            Map<String, dynamic> json) =>
        ConnectionRequestAcceptOrRejectResponce(
          message: json['message'] as String?,
          followBackPossible: json['follow_back_possible'] as bool?,
        );

Map<String, dynamic> _$ConnectionRequestAcceptOrRejectResponceToJson(
        ConnectionRequestAcceptOrRejectResponce instance) =>
    <String, dynamic>{
      'message': instance.message,
      'follow_back_possible': instance.followBackPossible,
    };
