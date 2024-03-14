import 'package:json_annotation/json_annotation.dart';

part 'profile_update_request_model.g.dart';

@JsonSerializable()
class ProfileUpdateRequestModel {
  String? name;
  @JsonKey(name: 'profile_pic')
  String? profilePic;

  ProfileUpdateRequestModel({this.name, this.profilePic});

  factory ProfileUpdateRequestModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileUpdateRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileUpdateRequestModelToJson(this);
}
