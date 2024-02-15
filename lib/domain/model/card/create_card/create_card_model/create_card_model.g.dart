// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCardModel _$CreateCardModelFromJson(Map<String, dynamic> json) =>
    CreateCardModel(
      personalDetails: json['personal_details'] == null
          ? null
          : PersonalDetailsCreate.fromJson(
              json['personal_details'] as Map<String, dynamic>),
      businessDetails: json['business_details'] == null
          ? null
          : BusinessDetailsCreate.fromJson(
              json['business_details'] as Map<String, dynamic>),
      bankDetails: json['bank_details'] == null
          ? null
          : BankDetailsCreate.fromJson(
              json['bank_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCardModelToJson(CreateCardModel instance) =>
    <String, dynamic>{
      'personal_details': instance.personalDetails,
      'business_details': instance.businessDetails,
      'bank_details': instance.bankDetails,
    };
