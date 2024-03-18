import 'package:json_annotation/json_annotation.dart';

part 'user_info_change_request_model.g.dart';

@JsonSerializable()
class UserInfoChangeRequestModel {
  String? name;
  @JsonKey(name: 'profile_pic')
  String? profilePic;

  UserInfoChangeRequestModel({this.name, this.profilePic});

  factory UserInfoChangeRequestModel.fromJson(Map<String, dynamic> json) {
    return _$UserInfoChangeRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserInfoChangeRequestModelToJson(this);
}
