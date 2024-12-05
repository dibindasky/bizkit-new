import 'package:json_annotation/json_annotation.dart';

part 'access.g.dart';

@JsonSerializable()
class Access {
  @JsonKey(name: '_id')
  String? id;
  String? access;
  List<String>? permissions;
  @JsonKey(name: 'comes_under')
  String? comesUnder;

  Access({this.id, this.access, this.permissions, this.comesUnder});

  factory Access.fromJson(Map<String, dynamic> json) {
    return _$AccessFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccessToJson(this);

  Access copyWith({
    String? id,
    String? access,
    List<String>? permissions,
    String? comesUnder,
  }) {
    return Access(
      id: id ?? this.id,
      access: access ?? this.access,
      permissions: permissions ?? this.permissions,
      comesUnder: comesUnder ?? this.comesUnder,
    );
  }

  static const String colLocalId = 'Local_id';
  static const String colId = '_id';
  static const String colCurrentUserId = 'current_user_id';
  static const String colAccess = 'access';
  static const String colPermissions = 'permissions';
  static const String colComesUnder = 'comes_under';
}
