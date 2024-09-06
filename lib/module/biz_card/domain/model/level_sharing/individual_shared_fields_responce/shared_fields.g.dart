// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndividualSharedFields _$IndividualSharedFieldsFromJson(
        Map<String, dynamic> json) =>
    IndividualSharedFields(
      personal: json['personal'] == null
          ? null
          : PersonalSharedFields.fromJson(
              json['personal'] as Map<String, dynamic>),
      business: json['business'] == null
          ? null
          : BusinessSharedFields.fromJson(
              json['business'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndividualSharedFieldsToJson(
        IndividualSharedFields instance) =>
    <String, dynamic>{
      'personal': instance.personal,
      'business': instance.business,
    };
