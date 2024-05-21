import 'package:json_annotation/json_annotation.dart';

part 'defauilt_qr.g.dart';

@JsonSerializable()
class DefauiltQr {
  int? id;
  bool? email;
  @JsonKey(name: 'phone_number')
  bool? phoneNumber;
  @JsonKey(name: 'personal_social_media')
  bool? personalSocialMedia;
  bool? address;
  bool? company;
  @JsonKey(name: 'business_email')
  bool? businessEmail;
  bool? accolades;
  bool? accreditation;
  @JsonKey(name: 'social_media_handles')
  bool? socialMediaHandles;
  @JsonKey(name: 'website_link')
  bool? websiteLink;
  @JsonKey(name: 'business_details_mobile_number')
  bool? businessDetailsMobileNumber;
  @JsonKey(name: 'update_all_cards')
  bool? updateAllCards;
  @JsonKey(name: 'user_id')
  int? userId;

  DefauiltQr({
    this.accolades,
    this.accreditation,
    this.id,
    this.email,
    this.phoneNumber,
    this.personalSocialMedia,
    this.address,
    this.company,
    this.businessEmail,
    this.socialMediaHandles,
    this.websiteLink,
    this.businessDetailsMobileNumber,
    this.updateAllCards,
    this.userId,
  });

  DefauiltQr copyWith({
    int? userId,
    bool? email,
    bool? phoneNumber,
    bool? company,
    bool? personalSocialMedia,
    bool? businessDetailsMobileNumber,
    bool? address,
    bool? socialMediaHandles,
    bool? websiteLink,
    bool? businessEmail,
    bool? accolades,
    bool? accreditation,
    bool? updateAllCards,
    int? id,
  }) {
    return DefauiltQr(
      accolades: accolades ?? this.accolades,
      accreditation: accreditation ?? this.accreditation,
      id: id ?? this.id,
      userId: userId ?? this.userId,
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
      updateAllCards: updateAllCards ?? this.updateAllCards,
    );
  }

  factory DefauiltQr.fromJson(Map<String, dynamic> json) {
    return _$DefauiltQrFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DefauiltQrToJson(this);
}
