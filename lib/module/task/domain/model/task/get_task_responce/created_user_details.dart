import 'package:json_annotation/json_annotation.dart';

part 'created_user_details.g.dart';

@JsonSerializable()
class CreatedUserDetails {
  String? id;
  String? name;
  @JsonKey(name: 'profile_picture')
  String? profilePicture;

  CreatedUserDetails({this.id, this.name, this.profilePicture});

  factory CreatedUserDetails.fromJson(Map<String, dynamic> json) {
    return _$CreatedUserDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatedUserDetailsToJson(this);

  // equals function to compare CreatedUserDetails objects
  bool equals(CreatedUserDetails other) {
    return id == other.id &&
        name == other.name &&
        profilePicture == other.profilePicture;
  }
}
