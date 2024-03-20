import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String? email;
  String? password;
  @JsonKey(name: 'device_type')
  int? deviceType;
  @JsonKey(name: 'device_id')
  String? deviceId;
  @JsonKey(name: 'device_token')
  String? deviceToken;

  LoginModel(
      {this.email,
      this.password,
      this.deviceId,
      this.deviceToken,
      this.deviceType});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
