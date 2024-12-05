import 'package:json_annotation/json_annotation.dart';

part 'user_search_success_responce.g.dart';

@JsonSerializable()
class UserSearchSuccessResponce {
  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? photo;
  int? count;

  UserSearchSuccessResponce({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.photo,
    this.count,
  });

  factory UserSearchSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$UserSearchSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserSearchSuccessResponceToJson(this);

  static const String colLocalId = 'local_id';
  static const String colUserId = 'user_id';
  static const String colName = 'name';
  static const String colEmail = 'email';
  static const String colPhoneNumber = 'phone_number';
  static const String colPhoto = 'photo';
  static const String colCount = 'count';
  static const String colCurrentUserId = 'current_user_id';
  static const String colModule = 'module';
}
