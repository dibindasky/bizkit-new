import 'package:json_annotation/json_annotation.dart';

part 'card_second_create_request_model.g.dart';

@JsonSerializable()
class CardSecondCreateRequestModel {
  dynamic id;
  String? name;
  @JsonKey(name: 'where_we_met')
  String? whereWeMet;
  String? location;
  String? occupation;
  String? notes;
  String? designation;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? company;
  String? website;
  String? selfie;
  String? image;

  CardSecondCreateRequestModel({
    this.id,
    this.name,
    this.whereWeMet,
    this.location,
    this.occupation,
    this.notes,
    this.designation,
    this.email,
    this.phoneNumber,
    this.company,
    this.website,
    this.selfie,
    this.image,
  });

  CardSecondCreateRequestModel copywith({
    String? id,
    String? name,
    String? whereWeMet,
    String? location,
    String? occupation,
    String? notes,
    String? designation,
    String? email,
    String? phoneNumber,
    String? company,
    String? website,
    String? selfie,
    String? image,
  }) {
    return CardSecondCreateRequestModel(
      id: id ?? this.id,
      name: name ?? this.name,
      whereWeMet: whereWeMet ?? this.whereWeMet,
      location: location ?? this.location,
      occupation: occupation ?? this.occupation,
      notes: notes ?? this.notes,
      designation: designation ?? this.designation,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      company: company ?? this.company,
      website: website ?? this.website,
      selfie: selfie ?? this.selfie,
      image: image ?? this.image,
    );
  }

  factory CardSecondCreateRequestModel.fromJson(Map<String, dynamic> json) {
    return _$CardSecondCreateRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardSecondCreateRequestModelToJson(this);
}
