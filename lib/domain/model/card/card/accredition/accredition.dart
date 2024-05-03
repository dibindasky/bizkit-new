import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accredition.g.dart';

@JsonSerializable()
class Accredition {
  int? id;

  @JsonKey(name: 'image')
  List<ImageCard>? images;
  String? label;
  String? date;
  String? description;
  String? event;
  @JsonKey(name: 'card_id')
  int? cardId;

  Accredition(
      {this.id,
      this.images,
      this.label,
      this.description,
      this.cardId,
      this.date,
      this.event});

  factory Accredition.fromJson(Map<String, dynamic> json) {
    return _$AccreditionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccreditionToJson(this);
}
