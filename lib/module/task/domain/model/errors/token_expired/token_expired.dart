import 'package:json_annotation/json_annotation.dart';

part 'token_expired.g.dart';

@JsonSerializable()
class TokenExpired {
  String? detail;

  TokenExpired({this.detail});

  factory TokenExpired.fromJson(Map<String, dynamic> json) {
    return _$TokenExpiredFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TokenExpiredToJson(this);
}
