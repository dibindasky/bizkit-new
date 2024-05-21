import 'package:json_annotation/json_annotation.dart';

import 'card_datum.dart';

part 'company_users.g.dart';

@JsonSerializable()
class CompanyUsers {
  int? id;
  @JsonKey(name: 'card_data')
  List<CardDatum>? cardData;
  String? password;
  @JsonKey(name: 'last_login')
  dynamic lastLogin;
  int? type;
  String? email;
  String? name;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  dynamic company;
  @JsonKey(name: 'website_link')
  dynamic websiteLink;
  String? address;
  @JsonKey(name: 'device_id')
  String? deviceId;
  @JsonKey(name: 'device_token')
  String? deviceToken;
  @JsonKey(name: 'has_card')
  bool? hasCard;
  @JsonKey(name: 'is_logined')
  bool? isLogined;
  @JsonKey(name: 'profile_pic')
  String? profilePic;
  @JsonKey(name: 'is_business')
  bool? isBusiness;
  @JsonKey(name: 'is_active')
  bool? isActive;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'is_staff')
  bool? isStaff;
  @JsonKey(name: 'is_superuser')
  bool? isSuperuser;
  @JsonKey(name: 'forgot_password_otp')
  dynamic forgotPasswordOtp;
  @JsonKey(name: 'forgot_password_email_verified')
  bool? forgotPasswordEmailVerified;

  CompanyUsers({
    this.id,
    this.cardData,
    this.password,
    this.lastLogin,
    this.type,
    this.email,
    this.name,
    this.phoneNumber,
    this.company,
    this.websiteLink,
    this.address,
    this.deviceId,
    this.deviceToken,
    this.hasCard,
    this.isLogined,
    this.profilePic,
    this.isBusiness,
    this.isActive,
    this.isVerified,
    this.isStaff,
    this.isSuperuser,
    this.forgotPasswordOtp,
    this.forgotPasswordEmailVerified,
  });

  factory CompanyUsers.fromJson(Map<String, dynamic> json) {
    return _$CompanyUsersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompanyUsersToJson(this);
}
