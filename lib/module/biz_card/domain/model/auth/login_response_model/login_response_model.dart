import 'package:bizkit/module/biz_card/domain/model/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  String? message;
  User? user;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  @JsonKey(name: 'access_token')
  String? accessToken;

  LoginResponseModel(
      {this.message, this.user, this.accessToken, this.refreshToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
