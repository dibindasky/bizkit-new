// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetailsCreate _$BusinessDetailsCreateFromJson(
        Map<String, dynamic> json) =>
    BusinessDetailsCreate(
      socialMediaHandles: (json['social_media_handles'] as List<dynamic>?)
          ?.map((e) =>
              SocialMediaHandleCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => ProductCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
      brochure: (json['brochure'] as List<dynamic>?)
          ?.map((e) => BrochureCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: (json['email'] as List<dynamic>?)
          ?.map((e) => EmailCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
      mobileNumber: (json['mobile_number'] as List<dynamic>?)
          ?.map((e) => MobileNumberCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessName: json['business_name'] as String?,
      designation: json['designation'] as String?,
      company: json['company'] as String?,
      address: json['address'] as String?,
      websiteLink: json['website_link'] as String?,
      logo: json['logo'],
      logoStory: json['logo_story'] as String?,
    );

Map<String, dynamic> _$BusinessDetailsCreateToJson(
        BusinessDetailsCreate instance) =>
    <String, dynamic>{
      'social_media_handles': instance.socialMediaHandles,
      'product': instance.product,
      'brochure': instance.brochure,
      'email': instance.email,
      'mobile_number': instance.mobileNumber,
      'business_name': instance.businessName,
      'designation': instance.designation,
      'company': instance.company,
      'address': instance.address,
      'website_link': instance.websiteLink,
      'logo': instance.logo,
      'logo_story': instance.logoStory,
    };
