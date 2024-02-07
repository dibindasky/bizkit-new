// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_adding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardAddingModel _$CardAddingModelFromJson(Map<String, dynamic> json) =>
    CardAddingModel(
      personalDetails: json['personal_details'] == null
          ? null
          : PersonalDetails.fromJson(
              json['personal_details'] as Map<String, dynamic>),
      businessDetails: json['business_details'] == null
          ? null
          : BusinessDetails.fromJson(
              json['business_details'] as Map<String, dynamic>),
      bankDetails: json['bank_details'] == null
          ? null
          : BankDetails.fromJson(json['bank_details'] as Map<String, dynamic>),
      user: json['user'] as int?,
    );

Map<String, dynamic> _$CardAddingModelToJson(CardAddingModel instance) =>
    <String, dynamic>{
      'personal_details': instance.personalDetails,
      'business_details': instance.businessDetails,
      'bank_details': instance.bankDetails,
      'user': instance.user,
    };
