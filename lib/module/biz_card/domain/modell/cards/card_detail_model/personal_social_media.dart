import 'package:json_annotation/json_annotation.dart';

part 'personal_social_media.g.dart';

@JsonSerializable()
class PersonalSocialMedia {
  String? label;
  String? link;
  @JsonKey(name: '_id')
  String? id;

  PersonalSocialMedia({this.label, this.link, this.id});

  factory PersonalSocialMedia.fromJson(Map<String, dynamic> json) {
    return _$PersonalSocialMediaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalSocialMediaToJson(this);
}
