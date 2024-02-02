import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? password;
  String? name;
  @JsonKey(name: 'company_name')
  String? companyName;
  String? address;

  SignUpModel({
    this.email,
    this.phoneNumber,
    this.password,
    this.name,
    this.companyName,
    this.address,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
