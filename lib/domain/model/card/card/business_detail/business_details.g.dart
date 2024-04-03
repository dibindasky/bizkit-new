// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetails _$BusinessDetailsFromJson(Map<String, dynamic> json) =>
    BusinessDetails(
      id: json['id'] as int?,
      email: json['email'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      businessName: json['businessName'] as String?,
      designation: json['designation'] as String?,
      company: json['company'] as String?,
      address: json['address'] as String?,
      websiteLink: json['website_link'] as String?,
      logoStory: json['logo_story'] as String?,
      isVerified: json['is_verified'] as bool?,
      isCompanySelected: json['is_company_selected'] as bool?,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$BusinessDetailsToJson(BusinessDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'mobile_number': instance.mobileNumber,
      'businessName': instance.businessName,
      'designation': instance.designation,
      'company': instance.company,
      'address': instance.address,
      'website_link': instance.websiteLink,
      'logo_story': instance.logoStory,
      'is_verified': instance.isVerified,
      'is_company_selected': instance.isCompanySelected,
      'user_id': instance.userId,
    };
