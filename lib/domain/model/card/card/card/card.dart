import 'package:json_annotation/json_annotation.dart';

import '../business_detail/business_details.dart';
import '../personal_data/personal_details.dart';

part 'card.g.dart';

@JsonSerializable()
class Card {
  int? id;
  @JsonKey(name: 'personal_details')
  PersonalDetails? personalDetails;
  @JsonKey(name: 'business_details')
  BusinessDetails? businessDetails;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'share')
  int? share;
  @JsonKey(name: 'views')
  int? views;
  @JsonKey(name: 'connection_id')
  int? connectionId;
  @JsonKey(name: 'connection_request_id')
  int? connectionRequestId;
  @JsonKey(name: 'card_link')
  String? cardLink;

  Card(
      {this.id,
      this.personalDetails,
      this.businessDetails,
      this.isDefault,
      this.userId,
      this.cardLink,
      this.share,
      this.connectionId,
      this.views});

  factory Card.fromJson(Map<String, dynamic> json) {
    return _$CardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
