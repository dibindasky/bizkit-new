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

  LogoCard({this.id, this.logo, this.logoStory, this.cardId}) {
    if (logo != null && logo!.substring(0, 5) == 'data:') {
      logo = logo!.substring('data:image/jpg;base64,'.length);
    }
  }

  factory LogoCard.fromJson(Map<String, dynamic> json) {
    return _$LogoCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogoCardToJson(this);

  LogoCard copyWith({
    int? id,
    String? logo,
    String? logoStory,
    int? cardId,
  }) {
    return LogoCard(
      id: id ?? this.id,
      logo: logo ?? this.logo,
      logoStory: logoStory ?? this.logoStory,
      cardId: cardId ?? this.cardId,
    );
  }
}
