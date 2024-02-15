import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class PhotoCreate {
  dynamic photos;

  PhotoCreate({this.photos});

  factory PhotoCreate.fromJson(Map<String, dynamic> json) =>
      _$PhotoCreateFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoCreateToJson(this);

  PhotoCreate copyWith({
    dynamic photos,
  }) {
    return PhotoCreate(
      photos: photos ?? this.photos,
    );
  }
}
