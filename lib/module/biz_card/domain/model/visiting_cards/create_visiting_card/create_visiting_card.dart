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
  @JsonKey(name: 'card_image')
  String? cardImage;
  bool image;

  CreateVisitingCard(
      {this.name,
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
      this.cardImage,
      this.image = false});

  factory CreateVisitingCard.fromJson(Map<String, dynamic> json) {
    return _$CreateVisitingCardFromJson(json);
  }

  // Map<String, dynamic> toJson() => _$CreateVisitingCardToJson(this);
  Map<String, dynamic> toJson() {
    return image
        ? {
            'name': name,
            'company': company,
            'phone_number': phoneNumber,
            'website': website,
            'designation': designation,
            'email': email,
            'occation': occation,
            'location': location,
            'occupation': occupation,
            'notes': notes,
            'selfie': selfie,
            'card_image': cardImage,
          }
        : {
            'name': name,
            'company': company,
            'phone_number': phoneNumber,
            'website': website,
            'designation': designation,
            'email': email,
            'occation': occation,
            'location': location,
            'occupation': occupation,
            'notes': notes,
            'selfie': selfie,
          };
  }

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
    String? cardImage,
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
      cardImage: cardImage ?? this.cardImage,
    );
  }
}
