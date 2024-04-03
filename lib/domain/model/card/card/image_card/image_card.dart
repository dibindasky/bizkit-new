import 'package:json_annotation/json_annotation.dart';

part 'image_card.g.dart';

@JsonSerializable()
class ImageCard {
  int? id;
  String? image;

  ImageCard({this.id, this.image});

  factory ImageCard.fromJson(Map<String, dynamic> json) {
    return _$ImageCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImageCardToJson(this);
}
