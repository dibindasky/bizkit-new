// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_card_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCardByIdModel _$CreateCardByIdModelFromJson(Map<String, dynamic> json) =>
    CreateCardByIdModel(
      personalDetails: json['personal_details'] as int?,
      businessDetails: json['business_details'] as int?,
      isVerified: json['"is_verified":true'] as bool? ?? false,
    );

Map<String, dynamic> _$CreateCardByIdModelToJson(
        CreateCardByIdModel instance) =>
    <String, dynamic>{
      'personal_details': instance.personalDetails,
      'business_details': instance.businessDetails,
      '"is_verified":true': instance.isVerified,
    };
