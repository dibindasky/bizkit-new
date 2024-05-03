// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_card_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCardDetailModel _$RequestCardDetailModelFromJson(
        Map<String, dynamic> json) =>
    RequestCardDetailModel(
      companyId: json['company_id'] as int?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$RequestCardDetailModelToJson(
        RequestCardDetailModel instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'card_id': instance.cardId,
    };
