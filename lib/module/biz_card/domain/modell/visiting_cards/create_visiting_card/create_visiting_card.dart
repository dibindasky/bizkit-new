import 'package:json_annotation/json_annotation.dart';

part 'create_visiting_card.g.dart';

@JsonSerializable()
class CreateVisitingCard {
  String? name;
  String? company;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? website;
  String? designation;
  String? email;
  String? occation;
  String? location;
  String? occupation;
  String? notes;
  String? selfie;

  CreateVisitingCard({
    this.name,
    this.company,
    this.phoneNumber,
    this.website,
    this.designation,
    this.email,
    this.occation,
    this.location,
    this.occupation,
    this.notes,
    this.selfie,
  });

  factory CreateVisitingCard.fromJson(Map<String, dynamic> json) {
    return _$CreateVisitingCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateVisitingCardToJson(this);
}
