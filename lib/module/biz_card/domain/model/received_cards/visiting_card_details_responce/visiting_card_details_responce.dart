import 'package:json_annotation/json_annotation.dart';

part 'visiting_card_details_responce.g.dart';

@JsonSerializable()
class VisitingCardDetailsResponce {
  @JsonKey(name: '_id')
  String? id;
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
  @JsonKey(name: 'is_disabled')
  bool? isDisabled;
  @JsonKey(name: 'user_id')
  String? userId;
  List<String>? selfie;
  @JsonKey(name: 'card_image')
  String? cardImage;

  VisitingCardDetailsResponce({
    this.id,
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
    this.isDisabled,
    this.userId,
    this.selfie,
    this.cardImage,
  });
  

  factory VisitingCardDetailsResponce.fromJson(Map<String, dynamic> json) {
    return _$VisitingCardDetailsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VisitingCardDetailsResponceToJson(this);


  VisitingCardDetailsResponce copyWith({
    String? id,
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
    bool? isDisabled,
    String? userId,
    List<String>? selfie,
    String? cardImage,
  }) {
    return VisitingCardDetailsResponce(
      id: id ?? this.id,
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
      isDisabled: isDisabled ?? this.isDisabled,
      userId: userId ?? this.userId,
      selfie: selfie ?? this.selfie,
      cardImage: cardImage ?? this.cardImage,
    );
  }

}
