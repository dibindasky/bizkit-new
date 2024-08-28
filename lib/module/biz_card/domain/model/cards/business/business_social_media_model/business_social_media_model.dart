import 'package:json_annotation/json_annotation.dart';

part 'business_social_media_model.g.dart';

@JsonSerializable()
class BusinessSocialMediaModel {
  String? label;
  String? link;
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'social_media_id')
  String? socialMediaId;

  BusinessSocialMediaModel({
    this.label,
    this.link,
    this.businessDetailsId,
    this.socialMediaId,
    this.bizcardId,
  });

  factory BusinessSocialMediaModel.fromJson(Map<String, dynamic> json) {
    return _$BusinessSocialMediaModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessSocialMediaModelToJson(this);
}
