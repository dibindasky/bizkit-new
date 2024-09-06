// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SharedFields _$SharedFieldsFromJson(Map<String, dynamic> json) => SharedFields(
      business: json['business'] == null
          ? null
          : BusinessSharedFields.fromJson(
              json['business'] as Map<String, dynamic>),
      personal: json['personal'] == null
          ? null
          : PersonalSharedFields.fromJson(
              json['personal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SharedFieldsToJson(SharedFields instance) =>
    <String, dynamic>{
      'business': instance.business,
      'personal': instance.personal,
    };
