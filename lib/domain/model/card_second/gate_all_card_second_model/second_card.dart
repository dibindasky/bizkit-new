import 'package:bizkit/domain/model/card_second/selfie/selfie_image_update_responce_model/selfie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'second_card.g.dart';

@JsonSerializable()
class SecondCard {
  int? id;
  String? image;
  List<Selfie>? selfie;
  String? name;
  @JsonKey(name: 'where_we_met')
  String? whereWeMet;
  String? location;
  String? occupation;
  String? notes;
  String? time;
  String? date;
  String? company;
  String? designation;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? website;
  @JsonKey(name: 'user_id')
  int? userId;

  SecondCard({
    this.id,
    this.image,
    this.selfie,
    this.name,
    this.whereWeMet,
    this.location,
    this.occupation,
    this.notes,
    this.time,
    this.date,
    this.company,
    this.designation,
    this.email,
    this.phoneNumber,
    this.website,
    this.userId,
  });
  factory SecondCard.fromJson(Map<String, dynamic> json) {
    return _$SecondCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SecondCardToJson(this);
}
