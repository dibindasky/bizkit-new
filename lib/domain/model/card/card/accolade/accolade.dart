import 'package:json_annotation/json_annotation.dart';

part 'accolade.g.dart';

@JsonSerializable()
class Accolade {
  int? id;
  @JsonKey(name: 'image')
  dynamic accoladesImage;
  @JsonKey(name: 'title')
  String? accolades;
  @JsonKey(name: 'description')
  String? accoladesDescription;
  @JsonKey(name: 'card_id')
  int? cardId;

  Accolade(
      {this.id,
      this.accoladesImage,
      this.accolades,
      this.accoladesDescription,
      this.cardId});

  factory Accolade.fromJson(Map<String, dynamic> json) {
    return _$AccoladeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccoladeToJson(this);
}
