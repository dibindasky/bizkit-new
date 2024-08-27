import 'package:json_annotation/json_annotation.dart';

part 'personal_social_media_request_model.g.dart';

@JsonSerializable()
class PersonalSocialMediaRequestModel {
  String? label;
  String? link;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'personal_details_id')
  String? personalDetailsId;
  @JsonKey(name: 'social_media_id')
  String? socialMediaId;

  PersonalSocialMediaRequestModel({
    this.label,
    this.link,
    this.bizcardId,
    this.socialMediaId,
    this.personalDetailsId,
  });

  factory PersonalSocialMediaRequestModel.fromJson(Map<String, dynamic> json) {
    return _$PersonalSocialMediaRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PersonalSocialMediaRequestModelToJson(this);
  }
}
