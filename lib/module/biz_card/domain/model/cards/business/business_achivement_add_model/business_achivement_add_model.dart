import 'package:json_annotation/json_annotation.dart';

part 'business_achivement_add_model.g.dart';

@JsonSerializable()
class BusinessAchivementAddModel {
  String? title;
  List<String>? images;
  String? description;
  String? event;
  String? date;
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'achievement_id')
  String? achievementId;

  BusinessAchivementAddModel({
    this.title,
    this.images,
    this.achievementId,
    this.description,
    this.event,
    this.date,
    this.businessDetailsId,
    this.bizcardId,
  });

  factory BusinessAchivementAddModel.fromJson(Map<String, dynamic> json) {
    return _$BusinessAchivementAddModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessAchivementAddModelToJson(this);
}
