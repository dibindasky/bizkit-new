import 'package:json_annotation/json_annotation.dart';

part 'card_response.g.dart';

@JsonSerializable()
class CardResponse {
  int? id;
  @JsonKey(name: 'card_link')
  String? cardLink;
  String? logo;
  String? name;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'views')
  int? views;
  @JsonKey(name: 'share')
  int? share;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'designation')
  String? designation;
  String? company;
  @JsonKey(name: 'personal_details_id')
  int? personalDetails;
  @JsonKey(name: 'business_details_id')
  int? businessDetails;
  int? percentage;

  CardResponse(
      {this.id,
      this.logo,
      this.isDefault,
      this.isArchived,
      this.userId,
      this.personalDetails,
      this.businessDetails,
      this.cardLink,
      this.company,
      this.designation,
      this.isVerified,
      this.share,
      this.views,
      this.percentage,
      this.name});

  factory CardResponse.fromJson(Map<String, dynamic> json) {
    return _$CardResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardResponseToJson(this);
}
