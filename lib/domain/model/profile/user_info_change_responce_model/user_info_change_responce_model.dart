import 'package:json_annotation/json_annotation.dart';

part 'user_info_change_responce_model.g.dart';

@JsonSerializable()
class UserInfoChangeResponceModel {
  int? id;
  String? name;
  @JsonKey(name: 'profile_pic')
  String? profilePic;

  UserInfoChangeResponceModel({this.id, this.name, this.profilePic});

  factory UserInfoChangeResponceModel.fromJson(Map<String, dynamic> json) {
    return _$UserInfoChangeResponceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserInfoChangeResponceModelToJson(this);
}
