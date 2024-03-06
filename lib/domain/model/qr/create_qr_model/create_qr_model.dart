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
  @JsonKey(name: 'business_details_mobile_number')
  bool? businessDetailsMobileNumber;
  bool? address;
  @JsonKey(name: 'social_media_handles')
  bool? socialMediaHandles;
  @JsonKey(name: 'website_link')
  bool? websiteLink;
  @JsonKey(name: 'business_email')
  bool? businessEmail;
  int? card;

  CreateQrModel(
      {this.email,
      this.phoneNumber,
      this.company,
      this.personalSocialMedia,
      this.businessDetailsMobileNumber,
      this.address,
      this.socialMediaHandles,
      this.websiteLink,
      this.card,
      this.businessEmail});

  factory CreateQrModel.fromJson(Map<String, dynamic> json) {
    return _$CreateQrModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateQrModelToJson(this);

  CreateQrModel copyWith({
    bool? email,
    bool? phoneNumber,
    bool? company,
    bool? personalSocialMedia,
    bool? businessDetailsMobileNumber,
    bool? address,
    bool? socialMediaHandles,
    bool? websiteLink,
    bool? businessEmail,
    int? card,
  }) {
    return CreateQrModel(
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        company: company ?? this.company,
        personalSocialMedia: personalSocialMedia ?? this.personalSocialMedia,
        businessDetailsMobileNumber:
            businessDetailsMobileNumber ?? this.businessDetailsMobileNumber,
        address: address ?? this.address,
        socialMediaHandles: socialMediaHandles ?? this.socialMediaHandles,
        websiteLink: websiteLink ?? this.websiteLink,
        businessEmail: businessEmail ?? this.businessEmail,
        card: card ?? this.card);
  }
}
