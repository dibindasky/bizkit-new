// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetails _$BusinessDetailsFromJson(Map<String, dynamic> json) =>
    BusinessDetails(
      businessEmail: json['business_email'] as String?,
      businessPhone: (json['business_phone'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      websiteLink: json['business_website'] as String?,
      id: json['_id'] as String?,
      businessCategory: json['business_category'] as String?,
      designation: json['designation'] as String?,
      companyName: json['company_name'] as String?,
      bankingDetails: json['bank_details'] == null
          ? null
          : BankingDetailsModel.fromJson(
              json['bank_details'] as Map<String, dynamic>),
      businessName: json['business_name'] as String?,
      businessAchievements: (json['business_achievements'] as List<dynamic>?)
          ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessSocialMedia: (json['business_social_media'] as List<dynamic>?)
          ?.map((e) => SocialMediaHandles.fromJson(e as Map<String, dynamic>))
          .toList(),
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      branchOffices: (json['branch_offices'] as List<dynamic>?)
          ?.map((e) => BranchOffice.fromJson(e as Map<String, dynamic>))
          .toList(),
      brochure: (json['brochure'] as List<dynamic>?)
          ?.map((e) => Brochure.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessLogo: json['business_logo'] as String?,
      logoStory: json['logo_story'] as String?,
      companyStory: json['company_story'] as String?,
    );

Map<String, dynamic> _$BusinessDetailsToJson(BusinessDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'business_category': instance.businessCategory,
      'designation': instance.designation,
      'business_website': instance.websiteLink,
      'company_name': instance.companyName,
      'business_name': instance.businessName,
      'business_email': instance.businessEmail,
      'business_phone': instance.businessPhone,
      'business_achievements': instance.businessAchievements,
      'business_social_media': instance.businessSocialMedia,
      'bank_details': instance.bankingDetails,
      'product': instance.product,
      'branch_offices': instance.branchOffices,
      'brochure': instance.brochure,
      'business_logo': instance.businessLogo,
      'logo_story': instance.logoStory,
      'company_story': instance.companyStory,
    };
