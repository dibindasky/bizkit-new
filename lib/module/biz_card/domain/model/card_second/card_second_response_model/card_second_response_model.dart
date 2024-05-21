import 'package:bizkit/module/biz_card/domain/model/card_second/get_second_card_model/selfie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_second_response_model.g.dart';

@JsonSerializable()
class CardSecondResponseModel {
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
  dynamic tag;
  @JsonKey(name: 'is_active')
  bool? isActive;
  @JsonKey(name: 'user_id')
  int? userId;

  CardSecondResponseModel({
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

  factory CardSecondResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CardSecondResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardSecondResponseModelToJson(this);
}
