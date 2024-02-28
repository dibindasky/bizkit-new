// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetails _$BusinessDetailsFromJson(Map<String, dynamic> json) =>
    BusinessDetails(
      id: json['id'] as int?,
      socialMediaHandles: (json['social_media_handles_id'] as List<dynamic>?)
          ?.map((e) => SocialMediaHandle.fromJson(e as Map<String, dynamic>))
          .toList(),
      product: (json['product_id'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      brochure: (json['brochure_id'] as List<dynamic>?)
          ?.map((e) => Brochure.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      logo: json['logo'] as String?,
      businessName: json['business_name'] as String?,
      designation: json['designation'] as String?,
      company: json['company'] as String?,
      address: json['address'] as String?,
      websiteLink: json['website_link'] as String?,
      logoStory: json['logo_story'] as String?,
      accredition: (json['accredition_id'] as List<dynamic>?)
          ?.map((e) => Accredition.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankDetails: json['bank_details_id'] == null
          ? null
          : BankDetails.fromJson(
              json['bank_details_id'] as Map<String, dynamic>),
      branchOffices: (json['branch_offices_id'] as List<dynamic>?)
          ?.map((e) => BranchOffices.fromJson(e as Map<String, dynamic>))
          .toList(),
      isVerified: json['is_verified'] as bool?,
    );

Map<String, dynamic> _$BusinessDetailsToJson(BusinessDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'social_media_handles_id': instance.socialMediaHandles,
      'accredition_id': instance.accredition,
      'product_id': instance.product,
      'brochure_id': instance.brochure,
      'email': instance.email,
      'mobile_number': instance.mobileNumber,
      'branch_offices_id': instance.branchOffices,
      'logo': instance.logo,
      'business_name': instance.businessName,
      'designation': instance.designation,
      'company': instance.company,
      'address': instance.address,
      'website_link': instance.websiteLink,
      'logo_story': instance.logoStory,
      'bank_details_id': instance.bankDetails,
      'is_verified': instance.isVerified,
    };
