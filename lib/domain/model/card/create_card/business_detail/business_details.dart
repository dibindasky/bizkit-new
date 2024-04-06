import 'package:bizkit/domain/model/card/create_card/accridition/accredition.dart';
import 'package:bizkit/domain/model/card/create_card/banking_detail/bank_details.dart';
import 'package:bizkit/domain/model/card/create_card/branch_offices/branch_offices.dart';
import 'package:bizkit/domain/model/card/create_card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/create_card/product/product.dart';
import 'package:bizkit/domain/model/card/create_card/social_media_handle/social_media_handle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'business_details.g.dart';

@JsonSerializable()
class BusinessDetailsCreate {
  String? email;
  @JsonKey(name: 'mobile_number')
  String? mobileNumber;
  @JsonKey(name: 'business_name')
  String? businessName;
  String? company;
  String? address;
  @JsonKey(name: 'website_link')
  String? websiteLink;

  BusinessDetailsCreate({
    this.email,
    this.mobileNumber,
    this.businessName,
    this.company,
    this.address,
    this.websiteLink,
  });

  factory BusinessDetailsCreate.fromJson(Map<String, dynamic> json) {
    return _$BusinessDetailsCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDetailsCreateToJson(this);

  BusinessDetailsCreate copyWith(
      {List<SocialMediaHandleCreate>? socialMediaHandles,
      List<BranchOffices>? branchOffices,
      List<ProductCreate>? product,
      List<BrochureCreate>? brochure,
      String? email,
      String? mobileNumber,
      BankDetailsCreate? bankDetails,
      String? businessName,
      String? designation,
      String? company,
      String? address,
      String? websiteLink,
      dynamic logo,
      String? logoStory,
      List<AccreditionCreate>? accredition}) {
    return BusinessDetailsCreate(
        email: email ?? this.email,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        businessName: businessName ?? this.businessName,
        company: company ?? this.company,
        address: address ?? this.address,
        websiteLink: websiteLink ?? this.websiteLink);
  }
}
