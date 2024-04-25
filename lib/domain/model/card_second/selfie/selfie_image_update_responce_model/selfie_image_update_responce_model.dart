import 'package:json_annotation/json_annotation.dart';

import 'selfie.dart';

part 'selfie_image_update_responce_model.g.dart';

@JsonSerializable()
class SelfieImageUpdateResponceModel {
  String? message;
  List<Selfie>? selfie;

  SelfieImageUpdateResponceModel({this.message, this.selfie});

  factory SelfieImageUpdateResponceModel.fromJson(Map<String, dynamic> json) {
    return _$SelfieImageUpdateResponceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SelfieImageUpdateResponceModelToJson(this);
  }
}
