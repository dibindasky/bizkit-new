import 'package:bizkit/domain/model/card/card/accredition/accredition.dart';
import 'package:bizkit/domain/model/card/card/bank_details/bank_details.dart';
import 'package:bizkit/domain/model/card/create_card/branch_offices/branch_offices.dart';
import 'package:json_annotation/json_annotation.dart';

import '../brochure/brochure.dart';
import '../product/product.dart';
import '../social_media/social_media_handle.dart';

part 'business_details.g.dart';

@JsonSerializable()
class BusinessDetails {
  int? id;
  @JsonKey(name: 'social_media_handles_id')
  List<SocialMediaHandle>? socialMediaHandles;
  @JsonKey(name: 'accredition_id')
  List<Accredition>? accredition;
  @JsonKey(name: 'product_id')
  List<Product>? product;
  @JsonKey(name: 'brochure_id')
  List<Brochure>? brochure;
  String? email;
  @JsonKey(name: 'mobile_number')
  String? mobileNumber;
  @JsonKey(name: 'branch_offices_id')
  List<BranchOffices>? branchOffices;
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
  @JsonKey(name: 'bank_details_id')
  BankDetails? bankDetails;
  @JsonKey(name: 'is_verified')
  bool? isVerified;

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
    this.accredition,
    this.bankDetails,
    this.branchOffices,
    this.isVerified,
  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return _$BusinessDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDetailsToJson(this);
}
