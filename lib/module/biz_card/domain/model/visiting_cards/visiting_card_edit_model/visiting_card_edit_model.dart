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
    return scanedImage
        ? {
            'card_id': cardId,
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
            'card_id': cardId,
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
}
