import 'package:json_annotation/json_annotation.dart';

part 'user_info_change_request_model.g.dart';

@JsonSerializable()
class UserInfoChangeRequestModel {
  int? id;
  @JsonKey(name: 'is_active')
  bool? isActive;
  String? name;
  @JsonKey(name: 'profile_pic')
  String? profilePic;

  UserInfoChangeRequestModel(
      {this.isActive, this.name, this.profilePic, this.id});

  UserInfoChangeRequestModel copyWith({
    int? id,
    String? profilePic,
    bool? isActive,
    String? name,
  }) {
    return UserInfoChangeRequestModel(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  factory UserInfoChangeRequestModel.fromJson(Map<String, dynamic> json) {
    return _$UserInfoChangeRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserInfoChangeRequestModelToJson(this);
}
