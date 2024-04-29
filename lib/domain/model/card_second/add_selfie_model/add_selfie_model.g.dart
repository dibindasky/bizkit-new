// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_selfie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSelfieModel _$AddSelfieModelFromJson(Map<String, dynamic> json) =>
    AddSelfieModel(
      businessCardId: json['business_card_id'] as int?,
      selfie: (json['selfie'] as List<dynamic>?)
          ?.map((e) => Selfie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddSelfieModelToJson(AddSelfieModel instance) =>
    <String, dynamic>{
      'business_card_id': instance.businessCardId,
      'selfie': instance.selfie,
    };
