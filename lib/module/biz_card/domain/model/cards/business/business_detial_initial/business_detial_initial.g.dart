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
      businessEmail: json['business_email'] as String?,
      bussinessPhone: (json['business_phone'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      businessDetailsId: json['business_details_id'] as String?,
      companyName: json['company_name'] as String?,
      companyStory: json['company_story'] as String?,
    );

Map<String, dynamic> _$BusinessDetialInitialToJson(
        BusinessDetialInitial instance) =>
    <String, dynamic>{
      'business_name': instance.businessName,
      'company_name': instance.companyName,
      'business_email': instance.businessEmail,
      'business_phone': instance.bussinessPhone,
      'business_website': instance.websiteLink,
      'business_details_id': instance.businessDetailsId,
      'company_story': instance.companyStory,
    };
