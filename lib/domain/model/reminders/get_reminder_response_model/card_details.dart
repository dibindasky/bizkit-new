import 'package:json_annotation/json_annotation.dart';

part 'card_details.g.dart';

@JsonSerializable()
class CardDetails {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  int? views;
  int? share;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'personal_details_id')
  int? personalDetailsId;
  @JsonKey(name: 'business_details_id')
  int? businessDetailsId;

  CardDetails({
    this.id,
    this.userId,
    this.isDefault,
    this.isArchived,
    this.views,
    this.share,
    this.isVerified,
    this.personalDetailsId,
    this.businessDetailsId,
  });

  factory CardDetails.fromJson(Map<String, dynamic> json) => _$CardDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CardDetailsToJson(this);
}
