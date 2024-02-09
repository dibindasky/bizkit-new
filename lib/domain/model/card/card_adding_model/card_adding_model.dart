import 'package:bizkit/domain/model/card/banking_detail/bank_details.dart';
import 'package:bizkit/domain/model/card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/personal_details/personal_details.dart';
import 'package:json_annotation/json_annotation.dart';

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

  CardAddingModel copyWith({
    PersonalDetails? personalDetails,
    BusinessDetails? businessDetails,
    BankDetails? bankDetails,
    int? user,
  }) {
    return CardAddingModel(
      personalDetails: personalDetails ?? this.personalDetails,
      businessDetails: businessDetails ?? this.businessDetails,
      bankDetails: bankDetails ?? this.bankDetails,
      user: user ?? this.user,
    );
  }
}
