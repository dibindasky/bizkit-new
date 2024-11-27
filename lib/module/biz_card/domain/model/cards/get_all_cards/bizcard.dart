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

  Bizcard({
    this.bizcardId,
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
    this.universalLink,
  });

  factory Bizcard.fromJson(Map<String, dynamic> json) {
    return _$BizcardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizcardToJson(this);

  /// The `copyWith` method
  Bizcard copyWith({
    String? bizcardId,
    int? completionLevel,
    bool? isDefault,
    bool? isBusinessEditable,
    bool? isArchived,
    String? designation,
    String? universalLink,
    String? qRLink,
    String? name,
    int? views,
    int? shareCount,
    String? companyName,
    String? logo,
    String? personalImage,
  }) {
    return Bizcard(
      bizcardId: bizcardId ?? this.bizcardId,
      completionLevel: completionLevel ?? this.completionLevel,
      isDefault: isDefault ?? this.isDefault,
      isBusinessEditable: isBusinessEditable ?? this.isBusinessEditable,
      isArchived: isArchived ?? this.isArchived,
      designation: designation ?? this.designation,
      universalLink: universalLink ?? this.universalLink,
      qRLink: qRLink ?? this.qRLink,
      name: name ?? this.name,
      views: views ?? this.views,
      shareCount: shareCount ?? this.shareCount,
      companyName: companyName ?? this.companyName,
      logo: logo ?? this.logo,
      personalImage: personalImage ?? this.personalImage,
    );
  }
}
