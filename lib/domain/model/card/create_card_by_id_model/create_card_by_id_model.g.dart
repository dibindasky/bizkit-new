// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_card_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCardByIdModel _$CreateCardByIdModelFromJson(Map<String, dynamic> json) =>
    CreateCardByIdModel(
      personalDetails: json['personal_details_id'] as int?,
      businessDetails: json['business_details_id'] as int?,
      isVerified: json['is_verified'] as bool? ?? false,
    );

Map<String, dynamic> _$CreateCardByIdModelToJson(
        CreateCardByIdModel instance) =>
    <String, dynamic>{
      'personal_details_id': instance.personalDetails,
      'business_details_id': instance.businessDetails,
      'is_verified': instance.isVerified,
    };
