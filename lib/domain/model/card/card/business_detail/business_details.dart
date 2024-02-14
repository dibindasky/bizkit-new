import 'package:json_annotation/json_annotation.dart';

import '../brochure/brochure.dart';
import '../email/email.dart';
import '../mobile_number/mobile_number.dart';
import '../product/product.dart';
import '../social_media/social_media_handle.dart';

part 'business_details.g.dart';

@JsonSerializable()
class BusinessDetails {
  int? id;
  @JsonKey(name: 'social_media_handles')
  List<SocialMediaHandle>? socialMediaHandles;
  List<Product>? product;
  List<Brochure>? brochure;
  List<Email>? email;
  @JsonKey(name: 'mobile_number')
  List<MobileNumber>? mobileNumber;
  String? logo;
  @JsonKey(name: 'business_name')
  String? businessName;
  String? designation;
  String? company;
  String? address;
  @JsonKey(name: 'website_link')
  String? websiteLink;
  @JsonKey(name: 'logo_story')
  String? logoStory;

  BusinessDetails({
    this.id,
    this.socialMediaHandles,
    this.product,
    this.brochure,
    this.email,
    this.mobileNumber,
    this.logo,
    this.businessName,
    this.designation,
    this.company,
    this.address,
    this.websiteLink,
    this.logoStory,
  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return _$BusinessDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDetailsToJson(this);
}
