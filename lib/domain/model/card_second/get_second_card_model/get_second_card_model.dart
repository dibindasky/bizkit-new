import 'package:json_annotation/json_annotation.dart';

part 'get_second_card_model.g.dart';

@JsonSerializable()
class GetSecondCardModel {
  int? id;
  String? image;
  String? selfie;
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
  dynamic tag;
  @JsonKey(name: 'is_active')
  bool? isActive;
  @JsonKey(name: 'user_id')
  int? userId;

  GetSecondCardModel({
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
    this.tag,
    this.isActive,
    this.userId,
  });

  factory GetSecondCardModel.fromJson(Map<String, dynamic> json) {
    return _$GetSecondCardModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetSecondCardModelToJson(this);
}
