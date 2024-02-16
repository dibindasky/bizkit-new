import 'package:json_annotation/json_annotation.dart';

part 'qr_response.g.dart';

@JsonSerializable()
class QrResponse {
  String? message;
  int? id;
  @JsonKey(name: 'qr_code')
  String? qrCode;

  QrResponse({this.message, this.id, this.qrCode});

  factory QrResponse.fromJson(Map<String, dynamic> json) {
    return _$QrResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QrResponseToJson(this);
}
