import 'package:bizkit/domain/model/card/create_card/banking_detail/bank_details.dart';
import 'package:bizkit/domain/model/card/create_card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/create_card/personal_details/personal_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_card_model.g.dart';

@JsonSerializable()
class CreateCardModel {
  @JsonKey(name: 'personal_details_id')
  PersonalDetailsCreate? personalDetails;
  @JsonKey(name: 'business_details_id')
  BusinessDetailsCreate? businessDetails;
  @JsonKey(name: 'bank_details')
  BankDetailsCreate? bankDetails;

  CreateCardModel({
    this.personalDetails,
    this.businessDetails,
    this.bankDetails,
  });

  factory CreateCardModel.fromJson(Map<String, dynamic> json) {
    return _$CreateCardModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateCardModelToJson(this);

  CreateCardModel copyWith({
    PersonalDetailsCreate? personalDetails,
    BusinessDetailsCreate? businessDetails,
    BankDetailsCreate? bankDetails,
    int? user,
  }) {
    return CreateCardModel(
      personalDetails: personalDetails ?? this.personalDetails,
      businessDetails: businessDetails ?? this.businessDetails,
      bankDetails: bankDetails ?? this.bankDetails,
    );
  }
}
