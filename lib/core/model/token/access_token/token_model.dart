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
  @JsonKey(name: 'logout_form_device')
  String? logoutFromDevice;

  TokenModel({
    this.accessToken,
    this.refreshToken,
    this.name,
    this.uid,
    this.logoutFromDevice,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  TokenModel copyWith({
    String? accessToken,
    String? refreshToken,
    String? name,
    String? uid,
    String? logoutFromDevice,
  }) {
    return TokenModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      logoutFromDevice: logoutFromDevice ?? this.logoutFromDevice,
    );
  }

  static const String colUserId = 'user_id';
  static const String colAccess = 'access';
  static const String colRefresh = 'refresh';
  static const String colName = 'name';
  static const String colLogout = 'logout_form_device';
}
