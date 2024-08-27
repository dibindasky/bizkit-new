import 'package:json_annotation/json_annotation.dart';

part 'business_achievement_deletionmodel.g.dart';

@JsonSerializable()
class BusinessAchievementDeletionmodel {
  @JsonKey(name: 'achievement_id')
  String? achievementId;
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;

  BusinessAchievementDeletionmodel({
    this.achievementId,
    this.businessDetailsId,
  });

  factory BusinessAchievementDeletionmodel.fromJson(Map<String, dynamic> json) {
    return _$BusinessAchievementDeletionmodelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BusinessAchievementDeletionmodelToJson(this);
  }
}
