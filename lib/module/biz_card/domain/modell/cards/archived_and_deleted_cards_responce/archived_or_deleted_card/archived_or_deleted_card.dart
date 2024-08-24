import 'package:json_annotation/json_annotation.dart';

part 'archived_or_deleted_card.g.dart';

@JsonSerializable()
class ArchivedOrDeletedCard {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  String? name;
  @JsonKey(name: 'company_name')
  String? companyName;
  @JsonKey(name: 'business_category')
  String? businessCategory;
  String? designation;
  dynamic logo;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  @JsonKey(name: 'is_disabled')
  bool? isDisabled;

  ArchivedOrDeletedCard({
    this.bizcardId,
    this.name,
    this.companyName,
    this.businessCategory,
    this.designation,
    this.logo,
    this.isArchived,
    this.isDisabled,
  });

  factory ArchivedOrDeletedCard.fromJson(Map<String, dynamic> json) {
    return _$ArchivedOrDeletedCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArchivedOrDeletedCardToJson(this);
}
