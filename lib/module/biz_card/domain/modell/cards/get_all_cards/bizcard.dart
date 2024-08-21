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

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'company_name')
  String? companyName;

  @JsonKey(name: 'logo')
  String? logo;

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
  });

  factory Bizcard.fromJson(Map<String, dynamic> json) {
    return _$BizcardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizcardToJson(this);
}
