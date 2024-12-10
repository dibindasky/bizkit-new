import 'package:bizkit/module/module_manager/domain/model/access/access.dart';
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
  @JsonKey(name: 'allowed_accesses')
  List<Access>? allowedAccesses;

  TokenModel({
    this.accessToken,
    this.refreshToken,
    this.name,
    this.uid,
    this.logoutFromDevice,
    this.organizationId,
    this.role,
    this.allowedAccesses,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json,
          {bool fromLocalDb = false}) =>
      TokenModel(
        accessToken: json['access'] as String?,
        refreshToken: json['refresh'] as String?,
        name: json['name'] as String?,
        uid: json['user_id'] as String?,
        logoutFromDevice: json['logout_form_device'] as String?,
        organizationId: json['organization_id'] as String?,
        role: json['role'] as String?,
        allowedAccesses: fromLocalDb
            ? null
            : (json['allowed_accesses'] as List<dynamic>?)
                ?.map((e) => Access.fromJson(e as Map<String, dynamic>))
                .toList(),
      );
  // _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  TokenModel copyWith(
      {String? accessToken,
      String? refreshToken,
      String? name,
      String? uid,
      String? logoutFromDevice,
      String? organizationId,
      List<Access>? allowedAccesses,
      String? role}) {
    return TokenModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      logoutFromDevice: logoutFromDevice ?? this.logoutFromDevice,
      organizationId: organizationId ?? this.organizationId,
      role: role ?? this.role,
      allowedAccesses: allowedAccesses ?? this.allowedAccesses,
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
