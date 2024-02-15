// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetails _$BusinessDetailsFromJson(Map<String, dynamic> json) =>
    BusinessDetails(
      id: json['id'] as int?,
      socialMediaHandles: (json['social_media_handles'] as List<dynamic>?)
          ?.map((e) => SocialMediaHandle.fromJson(e as Map<String, dynamic>))
          .toList(),
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      brochure: (json['brochure'] as List<dynamic>?)
          ?.map((e) => Brochure.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: (json['email'] as List<dynamic>?)
          ?.map((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList(),
      mobileNumber: (json['mobile_number'] as List<dynamic>?)
          ?.map((e) => MobileNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      logo: json['logo'] as String?,
      businessName: json['business_name'] as String?,
      designation: json['designation'] as String?,
      company: json['company'] as String?,
      address: json['address'] as String?,
      websiteLink: json['website_link'] as String?,
      logoStory: json['logo_story'] as String?,
    );

Map<String, dynamic> _$BusinessDetailsToJson(BusinessDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'social_media_handles': instance.socialMediaHandles,
      'product': instance.product,
      'brochure': instance.brochure,
      'email': instance.email,
      'mobile_number': instance.mobileNumber,
      'logo': instance.logo,
      'business_name': instance.businessName,
      'designation': instance.designation,
      'company': instance.company,
      'address': instance.address,
      'website_link': instance.websiteLink,
      'logo_story': instance.logoStory,
    };
