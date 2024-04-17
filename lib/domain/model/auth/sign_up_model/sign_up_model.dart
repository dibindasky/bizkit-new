import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'website_link')
  String? websiteLink;
  String? password;
  @JsonKey(name: 'company')
  String? companyName;
  String? address;
  @JsonKey(name: 'is_business')
  bool isBusiness;
  @JsonKey(name: 'is_verified')
  bool isVerified;

  SignUpModel({
    this.email,
    this.phoneNumber,
    this.password,
    this.websiteLink,
    this.companyName,
    this.address,
    this.isBusiness = true,
    this.isVerified = false,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
