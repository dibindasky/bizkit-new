import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accolade.g.dart';

@JsonSerializable()
class Accolade {
  int? id;
  @JsonKey(name: 'image')
  List<ImageCard>? images;
  @JsonKey(name: 'title')
  String? accolades;
  String? date;
  String? event;
  @JsonKey(name: 'description')
  String? accoladesDescription;
  @JsonKey(name: 'card_id')
  int? cardId;

  Accolade(
      {this.id,
      this.images,
      this.accolades,
      this.date,
      this.event,
      this.accoladesDescription,
      this.cardId});

  factory Accolade.fromJson(Map<String, dynamic> json) {
    return _$AccoladeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccoladeToJson(this);
}
