import 'package:json_annotation/json_annotation.dart';

part 'accredition.g.dart';

@JsonSerializable()
class Accredition {
  int? id;
  dynamic image;
  String? label;
  String? date;
  String? description;
  @JsonKey(name: 'card_id')
  int? cardId;

  Accredition(
      {this.id,
      this.image,
      this.label,
      this.description,
      this.cardId,
      this.date});

  factory Accredition.fromJson(Map<String, dynamic> json) {
    return _$AccreditionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccreditionToJson(this);
}
