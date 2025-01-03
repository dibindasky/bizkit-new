import 'package:json_annotation/json_annotation.dart';

part 'business_shared_fields.g.dart';

@JsonSerializable()
class BusinessSharedFields {
  @JsonKey(name: 'business_category')
  bool? businessCategory;
  bool? designation;
  bool? product;
  @JsonKey(name: 'business_achievements')
  bool? businessAchievements;
  @JsonKey(name: 'business_social_media')
  bool? businessSocialMedia;
  @JsonKey(name: 'branch_offices')
  bool? branchOffices;
  bool? brochure;
  @JsonKey(name: 'business_logo')
  bool? businessLogo;
  @JsonKey(name: 'bank_details')
  bool? bankDetails;
  @JsonKey(name: 'logo_story')
  bool? logoStory;

  BusinessSharedFields({
    this.businessCategory,
    this.designation,
    this.product,
    this.businessAchievements,
    this.businessSocialMedia,
    this.branchOffices,
    this.brochure,
    this.businessLogo,
    this.bankDetails,
    this.logoStory,
  });

  factory BusinessSharedFields.fromJson(Map<String, dynamic> json) {
    return _$BusinessSharedFieldsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessSharedFieldsToJson(this);
  BusinessSharedFields copyWith({
    bool? businessCategory,
    bool? designation,
    bool? product,
    bool? businessAchievements,
    bool? businessSocialMedia,
    bool? branchOffices,
    bool? brochure,
    bool? businessLogo,
    bool? bankDetails,
    bool? logoStory,
  }) {
    return BusinessSharedFields(
      businessCategory: businessCategory ?? this.businessCategory,
      designation: designation ?? this.designation,
      product: product ?? this.product,
      businessAchievements: businessAchievements ?? this.businessAchievements,
      businessSocialMedia: businessSocialMedia ?? this.businessSocialMedia,
      branchOffices: branchOffices ?? this.branchOffices,
      brochure: brochure ?? this.brochure,
      businessLogo: businessLogo ?? this.businessLogo,
      bankDetails: bankDetails ?? this.bankDetails,
      logoStory: logoStory ?? this.logoStory,
    );
  }

  bool checkBoolValue() {
    return (businessCategory ?? false) ||
        (designation ?? false) ||
        (product ?? false) ||
        (businessAchievements ?? false) ||
        (businessSocialMedia ?? false) ||
        (branchOffices ?? false) ||
        (brochure ?? false) ||
        (businessLogo ?? false) ||
        (bankDetails ?? false) ||
        (logoStory ?? false);
  }
}
