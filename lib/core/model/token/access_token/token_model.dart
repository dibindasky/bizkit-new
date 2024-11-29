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
  @JsonKey(name: 'organization_id')
  String? organizationId;
  String? role;

  TokenModel({
    this.accessToken,
    this.refreshToken,
    this.name,
    this.uid,
    this.logoutFromDevice,
    this.organizationId,
    this.role,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  TokenModel copyWith(
      {String? accessToken,
      String? refreshToken,
      String? name,
      String? uid,
      String? logoutFromDevice,
      String? organizationId,
      String? role}) {
    return TokenModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      logoutFromDevice: logoutFromDevice ?? this.logoutFromDevice,
      organizationId: organizationId ?? this.organizationId,
      role: role ?? this.role,
    );
  }

  static const String colUserId = 'user_id';
  static const String colAccess = 'access';
  static const String colRefresh = 'refresh';
  static const String colName = 'name';
  static const String colLogout = 'logout_form_device';
  static const String colOrganisationId = 'organization_id';
  static const String colRole = 'role';
}
