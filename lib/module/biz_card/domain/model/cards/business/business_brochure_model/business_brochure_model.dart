import 'package:json_annotation/json_annotation.dart';

part 'business_brochure_model.g.dart';

@JsonSerializable()
class BusinessBrochureModel {
  String? title;
  String? file;
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'brochure_id')
  String? brochureId;

  BusinessBrochureModel({
    this.title,
    this.brochureId,
    this.file,
    this.businessDetailsId,
    this.bizcardId,
  });

  factory BusinessBrochureModel.fromJson(Map<String, dynamic> json) {
    return _$BusinessBrochureModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessBrochureModelToJson(this);
}
