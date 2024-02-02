import 'package:json_annotation/json_annotation.dart';

part 'change_password_model.g.dart';

@JsonSerializable()
class ChangePasswordModel {
  String? email;
  @JsonKey(name: 'new_password')
  String? newPassword;

  ChangePasswordModel({this.email, this.newPassword});

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);
}
