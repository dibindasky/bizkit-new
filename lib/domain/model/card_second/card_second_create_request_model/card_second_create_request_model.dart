import 'package:bizkit/domain/model/card_second/get_second_card_model/selfie.dart';
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
  List<Selfie>? selfie;
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

  factory CardSecondCreateRequestModel.fromJson(Map<String, dynamic> json) {
    return _$CardSecondCreateRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardSecondCreateRequestModelToJson(this);
}
