import 'package:json_annotation/json_annotation.dart';

part 'profile_update_responce_model.g.dart';

@JsonSerializable()
class ProfileUpdateResponceModel {
  int? id;
  String? name;
  @JsonKey(name: 'profile_pic')
  String? profilePic;

  ProfileUpdateResponceModel({this.id, this.name, this.profilePic});

  factory ProfileUpdateResponceModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileUpdateResponceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileUpdateResponceModelToJson(this);
}
