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

  bool checkCardImage;
  bool checkCompany;
  bool checkPhoneNumber;
  bool checkWebsite;
  bool checkDesignation;
  bool checkEmail;
  bool checkOccation;
  bool checkLocation;
  bool checkOccupation;
  bool checkNotes;
  bool checkSelfie;

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
      this.checkCardImage = false,
      this.checkCompany = false,
      this.checkDesignation = false,
      this.checkPhoneNumber = false,
      this.checkWebsite = false,
      this.checkEmail = false,
      this.checkLocation = false,
      this.checkNotes = false,
      this.checkOccation = false,
      this.checkOccupation = false,
      this.checkSelfie = false});

  factory CreateVisitingCard.fromJson(Map<String, dynamic> json) {
    return _$CreateVisitingCardFromJson(json);
  }

  // Map<String, dynamic> toJson() => _$CreateVisitingCardToJson(this);
  // Map<String, dynamic> toJson() {
  //   if (checkCardImage) {
  //     return {
  //       'name': name,
  //       'company': company,
  //       'phone_number': phoneNumber,
  //       'website': website,
  //       'designation': designation,
  //       'email': email,
  //       'occation': occation,
  //       'location': location,
  //       'occupation': occupation,
  //       'notes': notes,
  //       'selfie': selfie,
  //       'card_image': cardImage,
  //     };
  //   } else {
  //     return {
  //       'name': name,
  //       'company': company,
  //       'phone_number': phoneNumber,
  //       'website': website,
  //       'designation': designation,
  //       'email': email,
  //       'occation': occation,
  //       'location': location,
  //       'occupation': occupation,
  //       'notes': notes,
  //       'selfie': selfie,
  //     };
  //   }
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
    };

    if (checkCardImage && cardImage != null) {
      data['card_image'] = cardImage;
    }
    if (checkCompany && company != null) {
      data['company'] = company;
    }
    if (checkPhoneNumber && phoneNumber != null) {
      data['phone_number'] = phoneNumber;
    }
    if (checkDesignation && designation != null) {
      data['designation'] = designation;
    }
    if (checkWebsite && website != null) {
      data['website'] = website;
    }

    if (checkEmail && email != null) {
      data['email'] = email;
    }
    if (checkOccation && occation != null) {
      data['occation'] = occation;
    }
    if (checkLocation && location != null) {
      data['location'] = location;
    }
    if (checkOccupation && occupation != null) {
      data['occupation'] = occupation;
    }
    if (checkNotes && notes != null) {
      data['notes'] = notes;
    }
    if (checkSelfie && selfie != null) {
      data['selfie'] = selfie;
    }

    return data;
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
