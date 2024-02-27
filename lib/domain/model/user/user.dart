import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? email;
  String? name;
  @JsonKey(name: 'company_name')
  String? companyName;
  String? address;
  @JsonKey(name: 'is_business')
  bool? isBusiness;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'website_link')
  String? websiteLink;
  int? id;
  int? localId;

  User(
      {this.email,
      this.name,
      this.companyName,
      this.address,
      this.isBusiness,
      this.phoneNumber,
      this.websiteLink,
      this.isVerified,
      this.id,
      this.localId});

  static const String colId = 'id';
  static const String colLocalId = 'LocalId';
  static const String colName = 'name';
  static const String colEmail = 'email';
  static const String colPhone = 'phone_number';
  static const String colWebsite = 'website_link';
  static const String colCompanyName = 'company_name';
  static const String colAddress = 'address';
  static const String colIsBusiness = 'is_business';
  static const String colIsVerified = 'is_verified';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
