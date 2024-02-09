import 'package:bizkit/domain/model/card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/email/email.dart';
import 'package:bizkit/domain/model/card/mobile_number/mobile_number.dart';
import 'package:bizkit/domain/model/card/product/product.dart';
import 'package:bizkit/domain/model/card/social_media_handle/social_media_handle.dart';
import 'package:json_annotation/json_annotation.dart';

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

  BusinessDetails copyWith({
    List<SocialMediaHandle>? socialMediaHandles,
    List<Product>? product,
    List<Brochure>? brochure,
    List<Email>? email,
    List<MobileNumber>? mobileNumber,
    String? businessName,
    String? designation,
    String? company,
    dynamic address,
    dynamic websiteLink,
    dynamic logo,
    dynamic logoStory,
  }) {
    return BusinessDetails(
      socialMediaHandles: socialMediaHandles ?? this.socialMediaHandles,
      product: product ?? this.product,
      brochure: brochure ?? this.brochure,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      businessName: businessName ?? this.businessName,
      designation: designation ?? this.designation,
      company: company ?? this.company,
      address: address ?? this.address,
      websiteLink: websiteLink ?? this.websiteLink,
      logo: logo ?? this.logo,
      logoStory: logoStory ?? this.logoStory,
    );
  }
}
