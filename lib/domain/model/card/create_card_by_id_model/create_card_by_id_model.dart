import 'package:json_annotation/json_annotation.dart';

part 'create_card_by_id_model.g.dart';

@JsonSerializable()
class CreateCardByIdModel {
  @JsonKey(name: 'personal_details_id')
  int? personalDetails;
  @JsonKey(name: 'business_details_id')
  int? businessDetails;
  @JsonKey(name: "is_verified")
  bool? isVerified;

  CreateCardByIdModel(
      {this.personalDetails, this.businessDetails, this.isVerified});

  factory CreateCardByIdModel.fromJson(Map<String, dynamic> json) {
    return _$CreateCardByIdModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateCardByIdModelToJson(this);

  CreateCardByIdModel copyWith({
    int? personalDetails,
    int? businessDetails,
    bool? isVerified,
  }) {
    return CreateCardByIdModel(
        personalDetails: personalDetails ?? this.personalDetails,
        businessDetails: businessDetails ?? this.businessDetails,
        isVerified: isVerified ?? this.isVerified);
  }
}
