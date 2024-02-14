import 'package:json_annotation/json_annotation.dart';

import '../bank_details/bank_details.dart';
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
  @JsonKey(name: 'bank_details')
  BankDetails? bankDetails;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  int? user;

  Card({
    this.id,
    this.personalDetails,
    this.businessDetails,
    this.bankDetails,
    this.isDefault,
    this.user,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return _$CardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
