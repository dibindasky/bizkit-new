import 'package:json_annotation/json_annotation.dart';

import 'selfie.dart';

part 'seond_card_new.g.dart';

@JsonSerializable()
class SecondCardNew {
  int? id;
  List<Selfie>? selfie;
  String? name;
  String? image;
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
  dynamic tag;
  @JsonKey(name: 'is_active')
  bool? isActive;
  @JsonKey(name: 'user_id')
  int? userId;

  SecondCardNew({
    this.id,
    this.selfie,
    this.name,
    this.image,
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
    this.tag,
    this.isActive,
    this.userId,
  });

  factory SecondCardNew.fromJson(Map<String, dynamic> json) {
    return _$SecondCardNewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SecondCardNewToJson(this);
}
