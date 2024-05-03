import 'package:json_annotation/json_annotation.dart';

part 'qr_model.g.dart';

@JsonSerializable()
class QRModel {
  int? id;
  String? logo;
  bool? email;
  bool? accolades;
  bool? accreditation;
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
  @JsonKey(name: 'business_email')
  bool? businessEmail;
  @JsonKey(name: 'qr_image_link')
  String? qrlink;
  @JsonKey(name: 'qr_code')
  String? qrCode;
  @JsonKey(name: 'card_id')
  int? cardId;
  @JsonKey(name: 'user_id')
  int? userId;

  QRModel({
    this.id,
    this.logo,
    this.email,
    this.accolades,
    this.accreditation,
    this.phoneNumber,
    this.company,
    this.personalSocialMedia,
    this.businessDetailsEmail,
    this.businessDetailsMobileNumber,
    this.address,
    this.socialMediaHandles,
    this.websiteLink,
    this.qrlink,
    this.cardId,
    this.userId,
    this.qrCode,
    this.businessEmail,
  });

  factory QRModel.fromJson(Map<String, dynamic> json) {
    return _$QRModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QRModelToJson(this);
}
