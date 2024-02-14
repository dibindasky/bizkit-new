import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  int? id;
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
  int? localId;

  Contact({
    this.id,
    this.email,
    this.name,
    this.companyName,
    this.address,
    this.isBusiness,
    this.password,
    this.phoneNumber,
    this.localId,
  });

  static const String colUserId = 'user_id';
  static const String colLocalId = 'Local_id';
  static const String colPhone = 'phone_number';
  static const String colName = 'user_name';
  static const String colAvatar = 'user_avatar';

  factory Contact.fromJson(Map<String, dynamic> json) {
    return _$ContactFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
