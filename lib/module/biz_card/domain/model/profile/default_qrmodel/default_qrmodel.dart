import 'package:json_annotation/json_annotation.dart';

part 'default_qrmodel.g.dart';

@JsonSerializable()
class DefaultQrmodel {
  int? id;
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
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'card_id')
  int? cardId;

  DefaultQrmodel({
    this.id,
    this.email,
    this.phoneNumber,
    this.company,
    this.personalSocialMedia,
    this.businessDetailsMobileNumber,
    this.address,
    this.socialMediaHandles,
    this.websiteLink,
    this.userId,
    this.cardId,
  });

  factory DefaultQrmodel.fromJson(Map<String, dynamic> json) {
    return _$DefaultQrmodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DefaultQrmodelToJson(this);
}
