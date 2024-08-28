import 'package:json_annotation/json_annotation.dart';

part 'create_card.g.dart';

@JsonSerializable()
class CreateCard {
  String? name;
  String? email;
  List<String>? phone;
  @JsonKey(name: 'business_category')
  String? businessCategory;
  String? designation;
  @JsonKey(name: 'company_name')
  String? companyName;

  CreateCard({
    this.name,
    this.email,
    this.phone,
    this.businessCategory,
    this.designation,
    this.companyName,
  });

  factory CreateCard.fromJson(Map<String, dynamic> json) {
    return _$CreateCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateCardToJson(this);
}
