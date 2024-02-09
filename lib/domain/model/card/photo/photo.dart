import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  dynamic photos;

  Photo({this.photos});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  Photo copyWith({
    dynamic photos,
  }) {
    return Photo(
      photos: photos ?? this.photos,
    );
  }
}
