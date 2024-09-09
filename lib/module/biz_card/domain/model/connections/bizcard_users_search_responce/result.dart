import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class BizCardUsers {
  @JsonKey(name: 'user_id')
  String? userId;
  String? username;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? designation;
  @JsonKey(name: 'company_name')
  dynamic companyName;
  @JsonKey(name: 'profile_picture')
  String? profilePicture;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'connection_exist')
  bool? connectionExist;

  String? connectionRequestId;

  BizCardUsers(
      {this.userId,
      this.username,
      this.email,
      this.phoneNumber,
      this.designation,
      this.companyName,
      this.profilePicture,
      this.bizcardId,
      this.connectionRequestId,
      this.connectionExist});

  factory BizCardUsers.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  BizCardUsers copyWith({
    String? userId,
    String? username,
    String? email,
    String? phoneNumber,
    String? designation,
    dynamic companyName,
    String? profilePicture,
    String? bizcardId,
    bool? connectionExist,
    String? connectionRequestId,
  }) {
    return BizCardUsers(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      designation: designation ?? this.designation,
      companyName: companyName ?? this.companyName,
      profilePicture: profilePicture ?? this.profilePicture,
      bizcardId: bizcardId ?? this.bizcardId,
      connectionExist: connectionExist ?? this.connectionExist,
      connectionRequestId: connectionRequestId ?? this.connectionRequestId,
    );
  }
}
