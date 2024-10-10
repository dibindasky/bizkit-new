import 'package:json_annotation/json_annotation.dart';

part 'completed_by.g.dart';

@JsonSerializable()
class CompletedBy {
  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  @JsonKey(name: 'profile_picture')
  dynamic profilePicture;

  CompletedBy({this.userId, this.name, this.profilePicture});

  factory CompletedBy.fromJson(Map<String, dynamic> json) {
    return _$CompletedByFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompletedByToJson(this);
}
