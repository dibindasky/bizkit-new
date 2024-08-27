import 'package:bizkit/module/biz_card/domain/modell/cards/image_card/image_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'achievement.g.dart';

@JsonSerializable()
class Achievement {
  String? title;
  List<ImageCard>? images;
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
    return _$PersonalAchievementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalAchievementToJson(this);
}
