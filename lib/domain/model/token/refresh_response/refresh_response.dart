import 'package:json_annotation/json_annotation.dart';

part 'refresh_response.g.dart';

@JsonSerializable()
class RefreshResponse {
  String? access;

  RefreshResponse({this.access});

  factory RefreshResponse.fromJson(Map<String, dynamic> json) {
    return _$RefreshResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RefreshResponseToJson(this);
}
