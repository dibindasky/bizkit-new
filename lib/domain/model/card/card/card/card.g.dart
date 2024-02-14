// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      id: json['id'] as int?,
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
      isDefault: json['is_default'] as bool?,
      user: json['user'] as int?,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'id': instance.id,
      'personal_details': instance.personalDetails,
      'business_details': instance.businessDetails,
      'bank_details': instance.bankDetails,
      'is_default': instance.isDefault,
      'user': instance.user,
    };
