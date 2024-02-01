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
  String? password;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  int? id;

  User({
    this.email,
    this.name,
    this.companyName,
    this.address,
    this.isBusiness,
    this.password,
    this.phoneNumber,
    this.id
  });

  static const String colId='id';
  static const String colName='name';
  static const String colEmail='email';
  static const String colPhone='phone';
  static const String colCompanyName='company_name';
  static const String colAddress='address';
  static const String colIsBusiness='is_business';

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map[colId] as int,
      name: map[colName] as String,
      email: map[colEmail] as String,
      phoneNumber: map[colPhone] as String,
      companyName: map[colCompanyName] as String,
      address: map[colAddress] as String,
      isBusiness: map[colIsBusiness] as bool,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
