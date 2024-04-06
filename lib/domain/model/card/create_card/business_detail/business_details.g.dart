// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetailsCreate _$BusinessDetailsCreateFromJson(
        Map<String, dynamic> json) =>
    BusinessDetailsCreate(
      email: json['email'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      businessName: json['business_name'] as String?,
      company: json['company'] as String?,
      address: json['address'] as String?,
      websiteLink: json['website_link'] as String?,
    );

Map<String, dynamic> _$BusinessDetailsCreateToJson(
        BusinessDetailsCreate instance) =>
    <String, dynamic>{
      'email': instance.email,
      'mobile_number': instance.mobileNumber,
      'business_name': instance.businessName,
      'company': instance.company,
      'address': instance.address,
      'website_link': instance.websiteLink,
    };
