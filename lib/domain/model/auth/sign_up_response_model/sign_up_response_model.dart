import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? password;
  String? name;
  @JsonKey(name: 'company_name')
  String? companyName;
  String? address;

  SignUpResponseModel({
    this.email,
    this.phoneNumber,
    this.password,
    this.name,
    this.companyName,
    this.address,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}
