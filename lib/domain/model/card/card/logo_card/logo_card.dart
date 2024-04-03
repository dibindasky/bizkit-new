import 'package:json_annotation/json_annotation.dart';

part 'logo_card.g.dart';

@JsonSerializable()
class LogoCard {
  int? id;
  String? logo;
  @JsonKey(name: 'logo_story')
  String? logoStory;
  @JsonKey(name: 'card_id')
  int? cardId;

  LogoCard({this.id, this.logo, this.logoStory, this.cardId});

  factory LogoCard.fromJson(Map<String, dynamic> json) {
    return _$LogoCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogoCardToJson(this);
}
