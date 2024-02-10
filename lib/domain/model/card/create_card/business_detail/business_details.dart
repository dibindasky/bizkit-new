import 'package:bizkit/domain/model/card/create_card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/create_card/email/email.dart';
import 'package:bizkit/domain/model/card/create_card/mobile_number/mobile_number.dart';
import 'package:bizkit/domain/model/card/create_card/product/product.dart';
import 'package:bizkit/domain/model/card/create_card/social_media_handle/social_media_handle.dart';
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
  String? address;
  @JsonKey(name: 'website_link')
  String? websiteLink;
  dynamic logo;
  @JsonKey(name: 'logo_story')
  String? logoStory;

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
    String? address,
    String? websiteLink,
    dynamic logo,
    String? logoStory,
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
