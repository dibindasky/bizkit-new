import 'package:json_annotation/json_annotation.dart';

part 'brochure.g.dart';

@JsonSerializable()
class Brochure {
  int? id;
  String? file;
  dynamic image;
  String? label;
  @JsonKey(name: 'card_id')
  int? cardId;

  Brochure({this.id, this.file, this.image, this.label, this.cardId});

  factory Brochure.fromJson(Map<String, dynamic> json) {
    return _$BrochureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BrochureToJson(this);
}