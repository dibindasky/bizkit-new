import 'package:json_annotation/json_annotation.dart';

part 'auth_postmodel.g.dart';

@JsonSerializable()
class AuthPostmodel {
  String? otp;
  String? name;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'password')
  String? password;

  AuthPostmodel(
      {this.otp, this.name, this.email, this.phoneNumber, this.password});

  factory AuthPostmodel.fromJson(Map<String, dynamic> json) {
    return _$AuthPostmodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthPostmodelToJson(this);

  AuthPostmodel copyWith({
    String? otp,
    String? name,
    String? email,
    String? phoneNumber,
    String? password,
  }) {
    return AuthPostmodel(
      otp: otp ?? this.otp,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }
}
