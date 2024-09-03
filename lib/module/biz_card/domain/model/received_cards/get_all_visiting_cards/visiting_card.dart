import 'package:json_annotation/json_annotation.dart';

part 'visiting_card.g.dart';

@JsonSerializable()
class VisitingCard {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? company;
  String? designation;
  String? notes;
  String? selfie;
  @JsonKey(name: 'card_image')
  String? cardImage;

  VisitingCard(
      {this.name,
      this.company,
      this.designation,
      this.notes,
      this.selfie,
      this.cardImage,
      this.id});

  factory VisitingCard.fromJson(Map<String, dynamic> json) {
    return _$VisitingCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VisitingCardToJson(this);

  VisitingCard copyWith({
    String? name,
    String? company,
    String? designation,
    String? notes,
    String? selfie,
    String? id,
    String? cardImage,
  }) {
    return VisitingCard(
        name: name ?? this.name,
        company: company ?? this.company,
        designation: designation ?? this.designation,
        notes: notes ?? this.notes,
        selfie: selfie ?? this.selfie,
        id: id ?? this.id,
        cardImage: cardImage ?? this.cardImage);
  }
}
