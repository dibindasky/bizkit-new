import 'package:json_annotation/json_annotation.dart';

part 'visiting_card_edit_model.g.dart';

@JsonSerializable()
class VisitingCardEditModel {
  @JsonKey(name: 'card_id')
  String? cardId;
  String? designation;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? notes;
  String? selfie;

  VisitingCardEditModel({
    this.cardId,
    this.designation,
    this.phoneNumber,
    this.notes,
    this.selfie,
  });

  factory VisitingCardEditModel.fromJson(Map<String, dynamic> json) {
    return _$VisitingCardEditModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VisitingCardEditModelToJson(this);
}
