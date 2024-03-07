// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_connection_with_card_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateConnectionWithCardIdModel _$CreateConnectionWithCardIdModelFromJson(
        Map<String, dynamic> json) =>
    CreateConnectionWithCardIdModel(
      cardId: json['card_id'] as int?,
      connectionRequestId: json['connection_request_id'] as int?,
    );

Map<String, dynamic> _$CreateConnectionWithCardIdModelToJson(
        CreateConnectionWithCardIdModel instance) =>
    <String, dynamic>{
      'card_id': instance.cardId,
      'connection_request_id': instance.connectionRequestId,
    };
