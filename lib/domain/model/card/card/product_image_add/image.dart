import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  String? image;

  Image({this.image}) {
    if (image != null && image!.substring(0, 5) == 'data:') {
      image = image!.substring('data:image/jpg;base64,'.length);
    }
  }

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
