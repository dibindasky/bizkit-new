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
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  int? id;
  int? localId;

  User(
      {this.email,
      this.name,
      this.companyName,
      this.address,
      this.isBusiness,
      this.phoneNumber,
      this.id,
      this.localId});

  static const String colId = 'id';
  static const String colLocalId = 'LocalId';
  static const String colName = 'name';
  static const String colEmail = 'email';
  static const String colPhone = 'phone_number';
  static const String colCompanyName = 'company_name';
  static const String colAddress = 'address';
  static const String colIsBusiness = 'is_business';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
