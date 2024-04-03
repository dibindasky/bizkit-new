// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      id: json['id'] as int?,
      personalDetails: json['personal_details'] == null
          ? null
          : PersonalDetails.fromJson(
              json['personal_details'] as Map<String, dynamic>),
      businessDetails: json['business_details'] == null
          ? null
          : BusinessDetails.fromJson(
              json['business_details'] as Map<String, dynamic>),
      isDefault: json['is_default'] as bool?,
      userId: json['user_id'] as int?,
      cardLink: json['card_link'] as String?,
      share: json['share'] as int?,
      connectionId: json['connection_id'] as int?,
      views: json['views'] as int?,
      accolades: (json['accolades'] as List<dynamic>?)
          ?.map((e) => Accolade.fromJson(e as Map<String, dynamic>))
          .toList(),
      accreditation: (json['accreditation'] as List<dynamic>?)
          ?.map((e) => Accredition.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankDetails: json['bank_details'] == null
          ? null
          : BankDetails.fromJson(json['bank_details'] as Map<String, dynamic>),
      branchOffices: (json['branch_office'] as List<dynamic>?)
          ?.map((e) => BranchOffice.fromJson(e as Map<String, dynamic>))
          .toList(),
      brochure: (json['brochure'] as List<dynamic>?)
          ?.map((e) => Brochure.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessDetailsId: json['business_details_id'] as int?,
      businessSocialMedia: (json['business_social_media'] as List<dynamic>?)
          ?.map((e) => SocialMediaHandle.fromJson(e as Map<String, dynamic>))
          .toList(),
      connectionRequestId: json['connection_request_id'] as int?,
      datesToRemember: (json['dates_to_remember'] as List<dynamic>?)
          ?.map((e) => DatesToRemember.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['is_active'] as bool?,
      isArchived: json['is_archived'] as bool?,
      isCompanyAutofilled: json['is_company_autofilled'] as bool?,
      isVerified: json['is_verified'] as bool?,
      percentage: json['percentage'] as int?,
      personalDetailsId: json['personal_details_id'] as int?,
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedia: (json['personal_social_media'] as List<dynamic>?)
          ?.map((e) => SocialMediaHandle.fromJson(e as Map<String, dynamic>))
          .toList(),
      logoCard: json['logo'] == null
          ? null
          : LogoCard.fromJson(json['logo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'id': instance.id,
      'personal_details': instance.personalDetails,
      'business_details': instance.businessDetails,
      'bank_details': instance.bankDetails,
      'is_default': instance.isDefault,
      'is_archived': instance.isArchived,
      'is_active': instance.isActive,
      'is_verified': instance.isVerified,
      'is_company_autofilled': instance.isCompanyAutofilled,
      'personal_details_id': instance.personalDetailsId,
      'business_details_id': instance.businessDetailsId,
      'percentage': instance.percentage,
      'user_id': instance.userId,
      'share': instance.share,
      'views': instance.views,
      'connection_id': instance.connectionId,
      'connection_request_id': instance.connectionRequestId,
      'card_link': instance.cardLink,
      'logo': instance.logoCard,
      'accreditation': instance.accreditation,
      'accolades': instance.accolades,
      'personal_social_media': instance.socialMedia,
      'business_social_media': instance.businessSocialMedia,
      'brochure': instance.brochure,
      'product': instance.product,
      'branch_office': instance.branchOffices,
      'dates_to_remember': instance.datesToRemember,
    };
