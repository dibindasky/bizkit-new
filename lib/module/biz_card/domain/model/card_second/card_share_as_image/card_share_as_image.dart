import 'package:json_annotation/json_annotation.dart';

part 'card_share_as_image.g.dart';

@JsonSerializable()
class CardShareAsImage {
  String? image;

  CardShareAsImage({this.image});

  factory CardShareAsImage.fromJson(Map<String, dynamic> json) {
    return _$CardShareAsImageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardShareAsImageToJson(this);
}
