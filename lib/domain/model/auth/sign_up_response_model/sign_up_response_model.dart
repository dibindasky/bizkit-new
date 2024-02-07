import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  String? message;
  int? id;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  bool? business;

  SignUpResponseModel({
    this.message,
    this.id,
    this.email,
    this.phoneNumber,
    this.business,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}
