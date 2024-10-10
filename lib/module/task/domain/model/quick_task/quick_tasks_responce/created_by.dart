import 'package:json_annotation/json_annotation.dart';

part 'created_by.g.dart';

@JsonSerializable()
class CreatedBy {
  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  @JsonKey(name: 'profile_picture')
  dynamic profilePicture;

  CreatedBy({this.userId, this.name, this.profilePicture});

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return _$CreatedByFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}
