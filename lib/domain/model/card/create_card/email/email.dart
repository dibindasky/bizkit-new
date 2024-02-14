import 'package:json_annotation/json_annotation.dart';

part 'email.g.dart';

@JsonSerializable()
class EmailCreate {
  String? email;

  EmailCreate({this.email});

  factory EmailCreate.fromJson(Map<String, dynamic> json) =>
      _$EmailCreateFromJson(json);

  Map<String, dynamic> toJson() => _$EmailCreateToJson(this);

  EmailCreate copyWith({
    String? email,
  }) {
    return EmailCreate(
      email: email ?? this.email,
    );
  }
}
