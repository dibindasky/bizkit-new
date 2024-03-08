import 'package:json_annotation/json_annotation.dart';

part 'forgott_password_request_model.g.dart';

@JsonSerializable()
class ForgottPasswordRequestModel {
  @JsonKey(name: 'old_password')
  String? oldPassword;
  @JsonKey(name: 'new_password')
  String? newPassword;

  ForgottPasswordRequestModel({this.oldPassword, this.newPassword});

  factory ForgottPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return _$ForgottPasswordRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForgottPasswordRequestModelToJson(this);
}
