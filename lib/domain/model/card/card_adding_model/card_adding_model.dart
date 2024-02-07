import 'package:json_annotation/json_annotation.dart';

import 'bank_details.dart';
import 'business_details.dart';
import 'personal_details.dart';

part 'card_adding_model.g.dart';

@JsonSerializable()
class CardAddingModel {
  @JsonKey(name: 'personal_details')
  PersonalDetails? personalDetails;
  @JsonKey(name: 'business_details')
  BusinessDetails? businessDetails;
  @JsonKey(name: 'bank_details')
  BankDetails? bankDetails;
  int? user;

  CardAddingModel({
    this.personalDetails,
    this.businessDetails,
    this.bankDetails,
    this.user,
  });

  factory CardAddingModel.fromJson(Map<String, dynamic> json) {
    return _$CardAddingModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardAddingModelToJson(this);
}
