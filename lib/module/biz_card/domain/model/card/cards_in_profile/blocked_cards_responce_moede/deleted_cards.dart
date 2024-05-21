import 'package:json_annotation/json_annotation.dart';

part 'deleted_cards.g.dart';

@JsonSerializable()
class DeletedCard {
  int? id;
  String? name;
  String? designation;
  String? logo;
  String? company;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  @JsonKey(name: 'is_active')
  bool? isActive;
  int? views;
  int? share;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'personal_details_id')
  int? personalDetailsId;
  @JsonKey(name: 'business_details_id')
  int? businessDetailsId;
  @JsonKey(name: 'card_link')
  String? cardLink;

  DeletedCard({
    this.id,
    this.name,
    this.designation,
    this.logo,
    this.company,
    this.isDefault,
    this.isArchived,
    this.isActive,
    this.views,
    this.share,
    this.isVerified,
    this.userId,
    this.personalDetailsId,
    this.businessDetailsId,
    this.cardLink,
  });

  factory DeletedCard.fromJson(Map<String, dynamic> json) {
    return _$DeletedCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeletedCardToJson(this);
}
