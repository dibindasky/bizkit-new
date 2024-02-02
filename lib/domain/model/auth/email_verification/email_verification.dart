import 'package:json_annotation/json_annotation.dart';

part 'email_verification.g.dart';

@JsonSerializable()
class EmailModel {
  String? email;

  EmailModel({this.email});

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return _$EmailVerificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmailVerificationToJson(this);
}
