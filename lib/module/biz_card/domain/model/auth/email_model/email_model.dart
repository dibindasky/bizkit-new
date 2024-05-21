import 'package:json_annotation/json_annotation.dart';

part 'email_model.g.dart';

@JsonSerializable()
class EmailModel {
  String? email;

  EmailModel({this.email});

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return _$EmailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmailModelToJson(this);
}
