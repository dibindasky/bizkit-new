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
    this.logoStory,
  });

  factory BusinessSharedFields.fromJson(Map<String, dynamic> json) {
    return _$BusinessSharedFieldsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessSharedFieldsToJson(this);
}
