// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_detial_initial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetialInitial _$BusinessDetialInitialFromJson(
        Map<String, dynamic> json) =>
    BusinessDetialInitial(
      websiteLink: json['business_website'] as String?,
      businessName: json['business_name'] as String?,
      businessEmail: json['business_emai'] as String?,
      bussinessPhone: (json['bussiness_phone'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      businessDetailsId: json['business_details_id'] as String?,
    );

Map<String, dynamic> _$BusinessDetialInitialToJson(
        BusinessDetialInitial instance) =>
    <String, dynamic>{
      'business_website': instance.websiteLink,
      'business_name': instance.businessName,
      'business_emai': instance.businessEmail,
      'bussiness_phone': instance.bussinessPhone,
      'business_details_id': instance.businessDetailsId,
    };