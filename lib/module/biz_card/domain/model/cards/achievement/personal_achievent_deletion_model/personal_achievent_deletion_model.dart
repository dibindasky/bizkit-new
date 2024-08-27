import 'package:json_annotation/json_annotation.dart';

part 'personal_achievent_deletion_model.g.dart';

@JsonSerializable()
class PersonalAchieventDeletionModel {
  @JsonKey(name: 'personal_details_id')
  String? personalDetailsId;
  @JsonKey(name: 'personal_achievement_id')
  String? personalAchievementId;

  PersonalAchieventDeletionModel({
    this.personalDetailsId,
    this.personalAchievementId,
  });

  factory PersonalAchieventDeletionModel.fromJson(Map<String, dynamic> json) {
    return _$PersonalAchieventDeletionModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PersonalAchieventDeletionModelToJson(this);
  }
}
