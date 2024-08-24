import 'package:json_annotation/json_annotation.dart';

part 'business_social_media.g.dart';

@JsonSerializable()
class BusinessSocialMedia {
  String? label;
  String? link;
  @JsonKey(name: '_id')
  String? id;

  BusinessSocialMedia({this.label, this.link, this.id});

  factory BusinessSocialMedia.fromJson(Map<String, dynamic> json) {
    return _$BusinessSocialMediaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessSocialMediaToJson(this);
}
