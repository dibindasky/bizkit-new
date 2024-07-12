import 'package:json_annotation/json_annotation.dart';

part 'auth_postmodel.g.dart';

@JsonSerializable()
class AuthPostmodel {
  String? otp;
  String? name;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  AuthPostmodel({this.otp, this.name, this.email, this.phoneNumber});

  factory AuthPostmodel.fromJson(Map<String, dynamic> json) {
    return _$AuthPostmodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthPostmodelToJson(this);

  AuthPostmodel copyWith({
    String? otp,
    String? name,
    String? email,
    String? phoneNumber,
  }) {
    return AuthPostmodel(
      otp: otp ?? this.otp,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
