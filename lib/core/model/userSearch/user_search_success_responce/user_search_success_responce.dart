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

  UserSearchSuccessResponce({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.photo,
  });

  factory UserSearchSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$UserSearchSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserSearchSuccessResponceToJson(this);
}
