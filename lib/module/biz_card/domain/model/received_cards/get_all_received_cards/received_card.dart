import 'package:json_annotation/json_annotation.dart';

part 'received_card.g.dart';

@JsonSerializable()
class ReceivedCard {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? company;
  String? designation;
  String? notes;
  String? selfie;
  @JsonKey(name: 'card_image')
  String? cardImage;

  ReceivedCard(
      {this.name,
      this.company,
      this.designation,
      this.notes,
      this.selfie,
      this.cardImage,
      this.id});

  factory ReceivedCard.fromJson(Map<String, dynamic> json) {
    return _$ReceivedCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReceivedCardToJson(this);

  ReceivedCard copyWith({
    String? name,
    String? company,
    String? designation,
    String? notes,
    String? selfie,
    String? id,
    String? cardImage,
  }) {
    return ReceivedCard(
        name: name ?? this.name,
        company: company ?? this.company,
        designation: designation ?? this.designation,
        notes: notes ?? this.notes,
        selfie: selfie ?? this.selfie,
        id: id ?? this.id,
        cardImage: cardImage ?? this.cardImage);
  }
}
