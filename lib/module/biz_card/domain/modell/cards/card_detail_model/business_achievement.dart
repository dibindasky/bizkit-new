import 'package:json_annotation/json_annotation.dart';

part 'business_achievement.g.dart';

@JsonSerializable()
class BusinessAchievement {
  String? title;
  List<String>? images;
  String? description;
  String? event;
  String? date;
  @JsonKey(name: '_id')
  String? id;

  BusinessAchievement({
    this.title,
    this.images,
    this.description,
    this.event,
    this.date,
    this.id,
  });

  factory BusinessAchievement.fromJson(Map<String, dynamic> json) {
    return _$BusinessAchievementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessAchievementToJson(this);
}
