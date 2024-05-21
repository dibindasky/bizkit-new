import 'package:json_annotation/json_annotation.dart';

part 'selfie.g.dart';

@JsonSerializable()
class Selfie {
  int? id;
  String? selfie;

  Selfie({this.id, this.selfie});

  factory Selfie.fromJson(Map<String, dynamic> json) {
    return _$SelfieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelfieToJson(this);
}
