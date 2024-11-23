import 'package:json_annotation/json_annotation.dart';

part 'image_card.g.dart';

@JsonSerializable()
class ImageCard {
  int? id;
  String? image;
  bool networkImage;

  ImageCard({this.id, this.image, this.networkImage = false});

  factory ImageCard.fromJson(Map<String, dynamic> json) {
    return _$ImageCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImageCardToJson(this);
}
