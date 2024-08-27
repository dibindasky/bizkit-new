import 'package:json_annotation/json_annotation.dart';

part 'personal_social_media_deletion.g.dart';

@JsonSerializable()
class PersonalSocialMediaDeletion {
  @JsonKey(name: 'social_media_id')
  String? socialMediaId;
  @JsonKey(name: 'personal_details_id')
  String? personalDetailsId;

  PersonalSocialMediaDeletion({this.socialMediaId, this.personalDetailsId});

  factory PersonalSocialMediaDeletion.fromJson(Map<String, dynamic> json) {
    return _$PersonalSocialMediaDeletionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalSocialMediaDeletionToJson(this);
}
