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
  List<String>? selfie;

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

  CreateVisitingCard copyWith({
    String? name,
    String? company,
    String? phoneNumber,
    String? website,
    String? designation,
    String? email,
    String? occation,
    String? location,
    String? occupation,
    String? notes,
    List<String>? selfie,
  }) {
    return CreateVisitingCard(
      name: name ?? this.name,
      company: company ?? this.company,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      website: website ?? this.website,
      designation: designation ?? this.designation,
      email: email ?? this.email,
      occation: occation ?? this.occation,
      location: location ?? this.location,
      occupation: occupation ?? this.occupation,
      notes: notes ?? this.notes,
      selfie: selfie ?? this.selfie,
    );
  }
}
