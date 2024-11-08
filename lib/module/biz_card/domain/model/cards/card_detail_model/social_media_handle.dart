import 'package:json_annotation/json_annotation.dart';

part 'social_media_handle.g.dart';

@JsonSerializable()
class SocialMediaHandles {
  String? label;
  String? link;
  @JsonKey(name: '_id')
  String? id;

  SocialMediaHandles({this.label, this.link, this.id});

  factory SocialMediaHandles.fromJson(Map<String, dynamic> json) {
    return _$SocialMediaHandlesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialMediaHandlesToJson(this);
}
