import 'package:json_annotation/json_annotation.dart';

part 'business_details.g.dart';

@JsonSerializable()
class BusinessDetails {
  int? id;
  String? email;
  @JsonKey(name: 'mobile_number')
  String? mobileNumber;
  String? businessName;
  String? designation;
  String? company;
  String? address;
  @JsonKey(name: 'website_link')
  String? websiteLink;
  @JsonKey(name: 'logo_story')
  String? logoStory;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'is_company_selected')
  bool? isCompanySelected;
  @JsonKey(name: 'user_id')
  int? userId;

  BusinessDetails(
      {this.id,
      this.email,
      this.mobileNumber,
      this.businessName,
      this.designation,
      this.company,
      this.address,
      this.websiteLink,
      this.logoStory,
      this.isVerified,
      this.isCompanySelected,
      this.userId});

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return _$BusinessDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDetailsToJson(this);
}
