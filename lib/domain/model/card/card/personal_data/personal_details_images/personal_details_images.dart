import 'package:bizkit/domain/model/card/card/photo/photo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_details_images.g.dart';

@JsonSerializable()
class PersonalDetailsImages {
  @JsonKey(name: 'personal_details_id')
  int? personalDetailsId;
  List<Photo>? photos;

  PersonalDetailsImages({this.personalDetailsId, this.photos});

  factory PersonalDetailsImages.fromJson(Map<String, dynamic> json) {
    return _$PersonalDetailsImagesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalDetailsImagesToJson(this);
}
