// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selfie_adding_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfieAddingRequestModel _$SelfieAddingRequestModelFromJson(
        Map<String, dynamic> json) =>
    SelfieAddingRequestModel(
      businessCardId: json['business_card_id'] as int?,
      selfie: (json['selfie'] as List<dynamic>?)
          ?.map((e) => Selfie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SelfieAddingRequestModelToJson(
        SelfieAddingRequestModel instance) =>
    <String, dynamic>{
      'business_card_id': instance.businessCardId,
      'selfie': instance.selfie,
    };
