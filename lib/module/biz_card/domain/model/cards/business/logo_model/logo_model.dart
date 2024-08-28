import 'package:json_annotation/json_annotation.dart';

part 'logo_model.g.dart';

@JsonSerializable()
class LogoModel {
  @JsonKey(name: 'business_logo')
  String? businessLogo;
  @JsonKey(name: 'logo_story')
  String? logoStory;
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;

  LogoModel({
    this.businessLogo,
    this.logoStory,
    this.businessDetailsId,
    this.bizcardId,
  });

  factory LogoModel.fromJson(Map<String, dynamic> json) {
    return _$LogoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogoModelToJson(this);
}
