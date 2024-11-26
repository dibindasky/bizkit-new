import 'package:json_annotation/json_annotation.dart';

part 'visiting_card_edit_model.g.dart';

@JsonSerializable()
class VisitingCardEditModel {
  @JsonKey(name: 'card_id')
  String? cardId;
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
  bool scanedImage;

  VisitingCardEditModel({
    this.cardId,
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
    this.cardImage,
    this.scanedImage = false,
  });

  factory VisitingCardEditModel.fromJson(Map<String, dynamic> json) {
    return _$VisitingCardEditModelFromJson(json);
  }

  // Map<String, dynamic> toJson() => _$VisitingCardEditModelToJson(this);

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = {};

  // Add fields conditionally if they are not null
  if (cardId != null) data['card_id'] = cardId;
  if (name != null) data['name'] = name;
  if (company != null) data['company'] = company;
  if (phoneNumber != null) data['phone_number'] = phoneNumber;
  if (website != null) data['website'] = website;
  if (designation != null) data['designation'] = designation;
  if (email != null) data['email'] = email;
  if (occation != null) data['occation'] = occation;
  if (location != null) data['location'] = location;
  if (occupation != null) data['occupation'] = occupation;
  if (notes != null) data['notes'] = notes;
  if (selfie != null) data['selfie'] = selfie;
  if (cardImage != null && scanedImage) {
    data['card_image'] = cardImage;
  }

  return data;
}
}
