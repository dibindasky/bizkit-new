import 'package:json_annotation/json_annotation.dart';
part 'personal_achievement_request_model.g.dart';

@JsonSerializable()
class PersonalAchievementRequestModel {
  String? title;
  String? description;
  List<String>? images;
  String? event;
  String? date;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'personal_details_id')
  String? personalDetailsId;
  @JsonKey(name: 'personal_achievement_id')
  String? personalAchievementId;

  PersonalAchievementRequestModel({
    this.title,
    this.description,
    this.images,
    this.event,
    this.date,
    this.bizcardId,
    this.personalDetailsId,
    this.personalAchievementId,
  });

  factory PersonalAchievementRequestModel.fromJson(Map<String, dynamic> json) {
    return _$PersonalAchievementRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PersonalAchievementRequestModelToJson(this);
  }
}
