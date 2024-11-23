import 'package:json_annotation/json_annotation.dart';

part 'bizcard.g.dart';

@JsonSerializable()
class Bizcard {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'completion_level')
  int? completionLevel;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'is_business_editable')
  bool? isBusinessEditable;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  @JsonKey(name: 'designation')
  String? designation;
  @JsonKey(name: "universal_link")
  String? universalLink;
  @JsonKey(name: "qr_code")
  String? qRLink;
  @JsonKey(name: 'name')
  String? name;
  int? views;
  @JsonKey(name: 'share_count')
  int? shareCount;
  @JsonKey(name: 'company_name')
  String? companyName;
  @JsonKey(name: 'logo')
  String? logo;
  @JsonKey(name: 'personal_image')
  String? personalImage;

  Bizcard(
      {this.bizcardId,
      this.completionLevel,
      this.isDefault,
      this.isBusinessEditable,
      this.isArchived,
      this.designation,
      this.name,
      this.companyName,
      this.logo,
      this.personalImage,
      this.qRLink,
      this.views,
      this.shareCount,
      this.universalLink});

  factory Bizcard.fromJson(Map<String, dynamic> json) {
    return _$BizcardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizcardToJson(this);
}
