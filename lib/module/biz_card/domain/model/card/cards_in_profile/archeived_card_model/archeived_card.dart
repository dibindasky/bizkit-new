import 'package:json_annotation/json_annotation.dart';

part 'archeived_card.g.dart';

@JsonSerializable()
class ArcheivedCard {
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

  ArcheivedCard({
    this.isActive,
    this.id,
    this.name,
    this.designation,
    this.logo,
    this.company,
    this.isDefault,
    this.isArchived,
    this.views,
    this.share,
    this.isVerified,
    this.userId,
    this.personalDetailsId,
    this.businessDetailsId,
    this.cardLink,
  });

  factory ArcheivedCard.fromJson(Map<String, dynamic> json) {
    return _$ArcheivedCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArcheivedCardToJson(this);
}
