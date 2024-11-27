// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_shared_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessSharedFields _$BusinessSharedFieldsFromJson(
        Map<String, dynamic> json) =>
    BusinessSharedFields(
      businessCategory: json['business_category'] as bool?,
      designation: json['designation'] as bool?,
      product: json['product'] as bool?,
      businessAchievements: json['business_achievements'] as bool?,
      businessSocialMedia: json['business_social_media'] as bool?,
      branchOffices: json['branch_offices'] as bool?,
      brochure: json['brochure'] as bool?,
      businessLogo: json['business_logo'] as bool?,
      bankDetails: json['bank_details'] as bool?,
      logoStory: json['logo_story'] as bool?,
    );

Map<String, dynamic> _$BusinessSharedFieldsToJson(
        BusinessSharedFields instance) =>
    <String, dynamic>{
      'business_category': instance.businessCategory,
      'designation': instance.designation,
      'product': instance.product,
      'business_achievements': instance.businessAchievements,
      'business_social_media': instance.businessSocialMedia,
      'branch_offices': instance.branchOffices,
      'brochure': instance.brochure,
      'business_logo': instance.businessLogo,
      'bank_details': instance.bankDetails,
      'logo_story': instance.logoStory,
    };
