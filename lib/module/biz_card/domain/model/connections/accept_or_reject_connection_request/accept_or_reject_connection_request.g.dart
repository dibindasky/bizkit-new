// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_or_reject_connection_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptOrRejectConnectionRequest _$AcceptOrRejectConnectionRequestFromJson(
        Map<String, dynamic> json) =>
    AcceptOrRejectConnectionRequest(
      connectionId: json['connection_id'] as String?,
      status: json['status'] as String?,
      sharedFields: json['shared_fields'] == null
          ? null
          : SharedFields.fromJson(
              json['shared_fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcceptOrRejectConnectionRequestToJson(
        AcceptOrRejectConnectionRequest instance) =>
    <String, dynamic>{
      'connection_id': instance.connectionId,
      'status': instance.status,
      'shared_fields': instance.sharedFields,
    };
