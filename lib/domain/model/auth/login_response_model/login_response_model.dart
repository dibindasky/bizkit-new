import 'package:bizkit/domain/model/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'Message')
  String? message;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  @JsonKey(name: 'access_token')
  String? accessToken;
  User? user;

  LoginResponseModel({
    this.message,
    this.refreshToken,
    this.accessToken,
    this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
