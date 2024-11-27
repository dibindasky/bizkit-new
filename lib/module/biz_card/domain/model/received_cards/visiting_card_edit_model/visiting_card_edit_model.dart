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

  // Add fields conditionally if they are not null and not empty
  if (cardId != null && cardId!.isNotEmpty) data['card_id'] = cardId;
  if (name != null && name!.isNotEmpty) data['name'] = name;
  if (company != null && company!.isNotEmpty) data['company'] = company;
  if (phoneNumber != null && phoneNumber!.isNotEmpty) {
    data['phone_number'] = phoneNumber;
  }
  if (website != null && website!.isNotEmpty) data['website'] = website;
  if (designation != null && designation!.isNotEmpty) {
    data['designation'] = designation;
  }
  if (email != null && email!.isNotEmpty) data['email'] = email;
  if (occation != null && occation!.isNotEmpty) data['occation'] = occation;
  if (location != null && location!.isNotEmpty) data['location'] = location;
  if (occupation != null && occupation!.isNotEmpty) {
    data['occupation'] = occupation;
  }
  if (notes != null && notes!.isNotEmpty) data['notes'] = notes;
  if (selfie != null && selfie!.isNotEmpty) data['selfie'] = selfie;
  if (cardImage != null && cardImage!.isNotEmpty) {
    data['card_image'] = cardImage;
  }

  return data;
}
}
