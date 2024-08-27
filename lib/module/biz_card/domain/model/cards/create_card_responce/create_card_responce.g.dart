// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_card_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCardResponce _$CreateCardResponceFromJson(Map<String, dynamic> json) =>
    CreateCardResponce(
      businessDetailsId: json['business_details_id'] as String?,
      personalDetailsId: json['personal_details_id'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      qrCodeId: json['qr_code_id'] as String?,
    );

Map<String, dynamic> _$CreateCardResponceToJson(CreateCardResponce instance) =>
    <String, dynamic>{
      'business_details_id': instance.businessDetailsId,
      'personal_details_id': instance.personalDetailsId,
      'bizcard_id': instance.bizcardId,
      'qr_code_id': instance.qrCodeId,
    };
