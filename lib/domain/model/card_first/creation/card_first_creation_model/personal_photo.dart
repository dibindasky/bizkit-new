import 'package:json_annotation/json_annotation.dart';

part 'personal_photo.g.dart';

@JsonSerializable()
class PersonalPhoto {
  String? photo;

  PersonalPhoto({this.photo});

  factory PersonalPhoto.fromJson(Map<String, dynamic> json) {
    return _$PersonalPhotoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalPhotoToJson(this);
}