import 'package:json_annotation/json_annotation.dart';

part 'social_media_handle.g.dart';

@JsonSerializable()
class SocialMediaHandle {
  String? label;
  @JsonKey(name: 'social_media')
  String? socialMedia;

  SocialMediaHandle({this.label, this.socialMedia});

  factory SocialMediaHandle.fromJson(Map<String, dynamic> json) {
    return _$SocialMediaHandleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialMediaHandleToJson(this);

  SocialMediaHandle copyWith({
    String? label,
    String? socialMedia,
  }) {
    return SocialMediaHandle(
      label: label ?? this.label,
      socialMedia: socialMedia ?? this.socialMedia,
    );
  }
}
