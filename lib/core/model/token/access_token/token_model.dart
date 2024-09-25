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
  @JsonKey(name: 'user_id')
  String? uid;

  TokenModel({this.accessToken, this.refreshToken, this.name, this.uid});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  static const String colUserId = 'user_id';
  static const String colAccess = 'access';
  static const String colRefresh = 'refresh';
  static const String colName = 'name';
}
