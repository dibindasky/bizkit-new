import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  @JsonKey(name: 'access')
  String? accessToken;
  @JsonKey(name: 'refresh')
  String? refreshToken;
  int? id;

  TokenModel({this.accessToken, this.refreshToken, this.id});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
