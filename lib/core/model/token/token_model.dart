import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  @JsonKey(name: 'access')
  String? accessToken;
  @JsonKey(name: 'refresh')
  String? refreshToken;
  @JsonKey(name: 'name')
  String? name;

  TokenModel({this.accessToken, this.refreshToken, this.name});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
