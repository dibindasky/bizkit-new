import 'package:json_annotation/json_annotation.dart';

part 'achievement.g.dart';

@JsonSerializable()
class Achievement {
  String? title;
  List<String>? images;
  String? description;
  String? event;
  String? date;
  @JsonKey(name: '_id')
  String? id;

  Achievement({
    this.title,
    this.images,
    this.description,
    this.event,
    this.date,
    this.id,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return _$AchievementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AchievementToJson(this);
}
