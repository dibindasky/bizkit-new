// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_check_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionCheckResponseModel _$ConnectionCheckResponseModelFromJson(
        Map<String, dynamic> json) =>
    ConnectionCheckResponseModel(
      connectionId: json['connection_id'] as String?,
      toUser: json['to_user'] as String?,
      toCard: json['to_card'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ConnectionCheckResponseModelToJson(
        ConnectionCheckResponseModel instance) =>
    <String, dynamic>{
      'connection_id': instance.connectionId,
      'to_user': instance.toUser,
      'to_card': instance.toCard,
      'status': instance.status,
    };
