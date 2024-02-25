import 'package:json_annotation/json_annotation.dart';

part 'sign_up_indivudal_model.g.dart';

@JsonSerializable()
class SignUpIndivudalModel {
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? password;
  String? name;
  @JsonKey(name: 'is_business')
  bool isBusiness;
  @JsonKey(name: 'is_verified')
  bool isVerified;

  SignUpIndivudalModel({
    this.email,
    this.phoneNumber,
    this.password,
    this.name,
    this.isBusiness = false,
    this.isVerified = false,
  });

  factory SignUpIndivudalModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpIndivudalModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpIndivudalModelToJson(this);
}
