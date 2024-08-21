import 'package:json_annotation/json_annotation.dart';

part 'create_card_responce.g.dart';

@JsonSerializable()
class CreateCardResponce {
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'personal_details_id')
  String? personalDetailsId;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'qr_code_id')
  String? qrCodeId;

  CreateCardResponce(
      {this.businessDetailsId,
      this.personalDetailsId,
      this.bizcardId,
      this.qrCodeId});

  factory CreateCardResponce.fromJson(Map<String, dynamic> json) {
    return _$CreateCardResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateCardResponceToJson(this);
}
