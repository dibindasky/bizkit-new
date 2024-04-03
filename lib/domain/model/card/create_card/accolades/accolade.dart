import 'package:json_annotation/json_annotation.dart';

part 'accolade.g.dart';

@JsonSerializable()
class AccoladeCreate {
  String? accolades;
  @JsonKey(name: 'accolades_image')
  dynamic accoladesImage;
  @JsonKey(name: 'accolades_description')
  String? accoladesDescription;
  @JsonKey(name: 'card_id')
  String? cardId;

  AccoladeCreate(
      {this.accolades,
      this.accoladesImage,
      this.accoladesDescription,
      this.cardId});

  factory AccoladeCreate.fromJson(Map<String, dynamic> json) {
    return _$AccoladeCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccoladeCreateToJson(this);

  AccoladeCreate copyWith(
      {String? accolades,
      dynamic accoladesImage,
      String? accoladesDescription,
      String? cardId}) {
    return AccoladeCreate(
        accolades: accolades ?? this.accolades,
        accoladesImage: accoladesImage ?? this.accoladesImage,
        accoladesDescription: accoladesDescription ?? this.accoladesDescription,
        cardId: cardId ?? this.cardId);
  }
}
