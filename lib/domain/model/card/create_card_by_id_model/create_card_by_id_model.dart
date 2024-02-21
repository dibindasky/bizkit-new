import 'package:json_annotation/json_annotation.dart';

part 'create_card_by_id_model.g.dart';

@JsonSerializable()
class CreateCardByIdModel {
  @JsonKey(name: 'personal_details')
  int? personalDetails;
  @JsonKey(name: 'business_details')
  int? businessDetails;
  @JsonKey(name: 'bank_details')
  int? bankDetails;

  CreateCardByIdModel({
    this.personalDetails,
    this.businessDetails,
    this.bankDetails,
  });

  factory CreateCardByIdModel.fromJson(Map<String, dynamic> json) {
    return _$CreateCardByIdModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateCardByIdModelToJson(this);

  CreateCardByIdModel copyWith({
    int? personalDetails,
    int? businessDetails,
    int? bankDetails,
  }) {
    return CreateCardByIdModel(
      personalDetails: personalDetails ?? this.personalDetails,
      businessDetails: businessDetails ?? this.businessDetails,
      bankDetails: bankDetails ?? this.bankDetails,
    );
  }
}
