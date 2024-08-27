import 'package:json_annotation/json_annotation.dart';

import 'business_details.dart';
import 'personal_details.dart';

part 'card_detail_model.g.dart';

@JsonSerializable()
class CardDetailModel {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'personal_details')
  PersonalDetails? personalDetails;
  @JsonKey(name: 'business_details')
  BusinessDetails? businessDetails;
  @JsonKey(name: 'completion_level')
  int? completionLevel;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'is_business_editable')
  bool? isBusinessEditable;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  @JsonKey(name: 'is_disabled')
  bool? isDisabled;
  @JsonKey(name: 'qr_code')
  String? qrCode;

  CardDetailModel({
    this.bizcardId,
    this.personalDetails,
    this.businessDetails,
    this.completionLevel,
    this.isDefault,
    this.isBusinessEditable,
    this.isArchived,
    this.isDisabled,
    this.qrCode,
  });

  factory CardDetailModel.fromJson(Map<String, dynamic> json) {
    return _$CardDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardDetailModelToJson(this);
}
