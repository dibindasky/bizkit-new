import 'package:json_annotation/json_annotation.dart';

part 'personal_achievement.g.dart';

@JsonSerializable()
class PersonalAchievement {
  String? title;
  List<String>? images;
  String? description;
  String? event;
  String? date;
  @JsonKey(name: '_id')
  String? id;

  PersonalAchievement({
    this.title,
    this.images,
    this.description,
    this.event,
    this.date,
    this.id,
  });

  factory PersonalAchievement.fromJson(Map<String, dynamic> json) {
    return _$PersonalAchievementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalAchievementToJson(this);
}
