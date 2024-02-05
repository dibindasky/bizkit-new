import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_model.g.dart';

@JsonSerializable()
class VerifyOtpModel {
  String? email;
  String? otp;

  VerifyOtpModel({this.email, this.otp});

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyOtpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyOtpModelToJson(this);
}
