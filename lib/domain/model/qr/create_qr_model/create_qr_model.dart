import 'package:json_annotation/json_annotation.dart';

part 'create_qr_model.g.dart';

@JsonSerializable()
class CreateQrModel {
  bool? email;
  @JsonKey(name: 'phone_number')
  bool? phoneNumber;
  bool? company;
  @JsonKey(name: 'personal_social_media')
  bool? personalSocialMedia;
  @JsonKey(name: 'business_details_email')
  bool? businessDetailsEmail;
  @JsonKey(name: 'business_details_mobile_number')
  bool? businessDetailsMobileNumber;
  bool? address;
  @JsonKey(name: 'social_media_handles')
  bool? socialMediaHandles;
  @JsonKey(name: 'website_link')
  bool? websiteLink;
  int? card;

  CreateQrModel({
    this.email,
    this.phoneNumber,
    this.company,
    this.personalSocialMedia,
    this.businessDetailsEmail,
    this.businessDetailsMobileNumber,
    this.address,
    this.socialMediaHandles,
    this.websiteLink,
    this.card,
  });

  factory CreateQrModel.fromJson(Map<String, dynamic> json) {
    return _$CreateQrModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateQrModelToJson(this);
}
