import 'package:json_annotation/json_annotation.dart';

part 'update_user_info_model.g.dart';

@JsonSerializable()
class UpdateUserInfoModel {
  int? id;
  @JsonKey(name: 'is_active')
  bool? isActive;
  String? name;
  @JsonKey(name: 'profile_pic')
  String? profilePic;

  UpdateUserInfoModel({this.isActive, this.name, this.profilePic, this.id});

  factory UpdateUserInfoModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateUserInfoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateUserInfoModelToJson(this);
}
