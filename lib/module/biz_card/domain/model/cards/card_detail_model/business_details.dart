import 'package:bizkit/module/biz_card/domain/model/cards/business/banking_details_model/banking_details_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/social_media_handle.dart';
import 'package:json_annotation/json_annotation.dart';

import 'branch_office.dart';
import 'brochure.dart';
import 'product.dart';

part 'business_details.g.dart';

@JsonSerializable()
class BusinessDetails {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'business_category')
  String? businessCategory;
  String? designation;
  @JsonKey(name: 'business_website')
  String? websiteLink;
  @JsonKey(name: 'company_name')
  String? companyName;
  @JsonKey(name: 'business_name')
  String? businessName;
  @JsonKey(name: 'business_email')
  String? businessEmail;
  @JsonKey(name: 'business_phone')
  List<String>? businessPhone;
  @JsonKey(name: 'business_achievements')
  List<Achievement>? businessAchievements;
  @JsonKey(name: 'business_social_media')
  List<SocialMediaHandles>? businessSocialMedia;
  @JsonKey(name: 'bank_details')
  BankingDetailsModel? bankingDetails;
  List<Product>? product;
  @JsonKey(name: 'branch_offices')
  List<BranchOffice>? branchOffices;
  List<Brochure>? brochure;
  @JsonKey(name: 'business_logo')
  String? businessLogo;
  @JsonKey(name: 'logo_story')
  String? logoStory;
  @JsonKey(name: 'company_story')
  String? companyStory;

  BusinessDetails({
    this.businessEmail,
    this.businessPhone,
    this.websiteLink,
    this.id,
    this.businessCategory,
    this.designation,
    this.companyName,
    this.bankingDetails,
    this.businessName,
    this.businessAchievements,
    this.businessSocialMedia,
    this.product,
    this.branchOffices,
    this.brochure,
    this.businessLogo,
    this.logoStory,
    this.companyStory,
  });

    BusinessDetails copyWith({
    String? id,
    String? businessCategory,
    String? designation,
    String? websiteLink,
    String? companyName,
    String? businessName,
    String? businessEmail,
    List<String>? businessPhone,
    List<Achievement>? businessAchievements,
    List<SocialMediaHandles>? businessSocialMedia,
    BankingDetailsModel? bankingDetails,
    List<Product>? product,
    List<BranchOffice>? branchOffices,
    List<Brochure>? brochure,
    String? businessLogo,
    String? logoStory,
    String? companyStory,
  }) {
    return BusinessDetails(
      id: id ?? this.id,
      businessCategory: businessCategory ?? this.businessCategory,
      designation: designation ?? this.designation,
      websiteLink: websiteLink ?? this.websiteLink,
      companyName: companyName ?? this.companyName,
      businessName: businessName ?? this.businessName,
      businessEmail: businessEmail ?? this.businessEmail,
      businessPhone: businessPhone ?? this.businessPhone,
      businessAchievements: businessAchievements ?? this.businessAchievements,
      businessSocialMedia: businessSocialMedia ?? this.businessSocialMedia,
      bankingDetails: bankingDetails ?? this.bankingDetails,
      product: product ?? this.product,
      branchOffices: branchOffices ?? this.branchOffices,
      brochure: brochure ?? this.brochure,
      businessLogo: businessLogo ?? this.businessLogo,
      logoStory: logoStory ?? this.logoStory,
      companyStory: companyStory ?? this.companyStory,
    );
  }

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return _$BusinessDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDetailsToJson(this);
}
