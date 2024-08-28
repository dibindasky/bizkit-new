import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:json_annotation/json_annotation.dart';

import 'branch_office.dart';
import 'brochure.dart';
import 'business_social_media.dart';
import 'product.dart';

part 'business_details.g.dart';

@JsonSerializable()
class BusinessDetails {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'business_category')
  String? businessCategory;
  String? designation;
  @JsonKey(name: 'company_name')
  String? companyName;
  @JsonKey(name: 'business_name')
  String? businessName;
  @JsonKey(name: 'business_achievements')
  List<Achievement>? businessAchievements;
  @JsonKey(name: 'business_social_media')
  List<BusinessSocialMedia>? businessSocialMedia;
  List<Product>? product;
  @JsonKey(name: 'branch_offices')
  List<BranchOffice>? branchOffices;
  List<Brochure>? brochure;
  @JsonKey(name: 'business_logo')
  String? businessLogo;
  @JsonKey(name: 'logo_story')
  String? logoStory;

  BusinessDetails({
    this.id,
    this.businessCategory,
    this.designation,
    this.companyName,
    this.businessName,
    this.businessAchievements,
    this.businessSocialMedia,
    this.product,
    this.branchOffices,
    this.brochure,
    this.businessLogo,
    this.logoStory,
  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return _$BusinessDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDetailsToJson(this);
}
