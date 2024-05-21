import 'package:json_annotation/json_annotation.dart';

part 'foregott_password_responce_mdel.g.dart';

@JsonSerializable()
class ForegottPasswordResponceMdel {
  String? message;
  String? refresh;
  String? access;
  @JsonKey(name: 'user_id')
  int? userId;

  ForegottPasswordResponceMdel({
    this.message,
    this.refresh,
    this.access,
    this.userId,
  });

  factory ForegottPasswordResponceMdel.fromJson(Map<String, dynamic> json) {
    return _$ForegottPasswordResponceMdelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForegottPasswordResponceMdelToJson(this);
}
