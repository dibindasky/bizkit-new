import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class ContactModel {
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
  @JsonKey(name: 'photo_url')
  String? photo;
  int? localId;

  ContactModel({
    this.id,
    this.email,
    this.name,
    this.companyName,
    this.address,
    this.isBusiness,
    this.password,
    this.phoneNumber,
    this.photo,
    this.localId,
  });

  static const String colUserId = 'user_id';
  static const String colLocalId = 'Local_id';
  static const String colPhone = 'phone_number';
  static const String colName = 'user_name';
  static const String colPhoto = 'user_photo';

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return _$ContactModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}
