import 'package:json_annotation/json_annotation.dart';

part 'auth_post_phone_model.g.dart';

@JsonSerializable()
class AuthPostPhoneModel {
  String? otp;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;

  AuthPostPhoneModel(
      {this.otp, this.phoneNumber, this.name, this.email});

  factory AuthPostPhoneModel.fromJson(Map<String, dynamic> json) {
    return _$AuthPostPhoneModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthPostPhoneModelToJson(this);

  AuthPostPhoneModel copyWith({
    String? otp,
    String? phoneNumber,
    String? password,
    String? email,
    String? name,
  }) {
    return AuthPostPhoneModel(
      otp: otp ?? this.otp,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
}
