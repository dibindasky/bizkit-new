import 'package:bizkit/domain/model/card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/product/product.dart';
import 'package:bizkit/domain/model/card/social_media_handle/social_media_handle.dart';
import 'package:json_annotation/json_annotation.dart';

import 'email.dart';
import 'mobile_number.dart';

part 'business_details.g.dart';

@JsonSerializable()
class BusinessDetails {
  @JsonKey(name: 'social_media_handles')
  List<SocialMediaHandle>? socialMediaHandles;
  List<Product>? product;
  List<Brochure>? brochure;
  List<Email>? email;
  @JsonKey(name: 'mobile_number')
  List<MobileNumber>? mobileNumber;
  @JsonKey(name: 'business_name')
  String? businessName;
  String? designation;
  String? company;
  dynamic address;
  @JsonKey(name: 'website_link')
  dynamic websiteLink;
  dynamic logo;
  @JsonKey(name: 'logo_story')
  dynamic logoStory;

  BusinessDetails({
    this.socialMediaHandles,
    this.product,
    this.brochure,
    this.email,
    this.mobileNumber,
    this.businessName,
    this.designation,
    this.company,
    this.address,
    this.websiteLink,
    this.logo,
    this.logoStory,
  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return _$BusinessDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDetailsToJson(this);
}
