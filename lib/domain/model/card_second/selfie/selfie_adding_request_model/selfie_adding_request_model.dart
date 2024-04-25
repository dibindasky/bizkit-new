import 'package:json_annotation/json_annotation.dart';

import 'selfie.dart';

part 'selfie_adding_request_model.g.dart';

@JsonSerializable()
class SelfieAddingRequestModel {
  @JsonKey(name: 'business_card_id')
  int? businessCardId;
  List<Selfie>? selfie;

  SelfieAddingRequestModel({this.businessCardId, this.selfie});

  factory SelfieAddingRequestModel.fromJson(Map<String, dynamic> json) {
    return _$SelfieAddingRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelfieAddingRequestModelToJson(this);
}
