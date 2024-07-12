import 'package:json_annotation/json_annotation.dart';

part 'auth_post_phone_model.g.dart';

@JsonSerializable()
class AuthPostPhoneModel {
  String? otp;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  AuthPostPhoneModel({this.otp, this.phoneNumber});

  factory AuthPostPhoneModel.fromJson(Map<String, dynamic> json) {
    return _$AuthPostPhoneModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthPostPhoneModelToJson(this);

  AuthPostPhoneModel copyWith({
    String? otp,
    String? phoneNumber,
  }) {
    return AuthPostPhoneModel(
      otp: otp ?? this.otp,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
