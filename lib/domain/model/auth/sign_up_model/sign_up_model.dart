import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? password;
  @JsonKey(name: 'company_name')
  String? companyName;
  String? address;
  @JsonKey(name: 'is_business')
  bool isBusiness;

  SignUpModel(
      {this.email,
      this.phoneNumber,
      this.password,
      this.companyName,
      this.address,
      this.isBusiness = true});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
