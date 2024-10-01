class PersonalAchievementRequestModel {
  String? title;
  String? description;
  List<String>? images;
  String? event;
  String? date;
  String? bizcardId;
  String? personalDetailsId;
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
    return PersonalAchievementRequestModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      event: json['event'] as String?,
      date: json['date'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      personalDetailsId: json['personal_details_id'] as String?,
      personalAchievementId: json['personal_achievement_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (title != null && title!.isNotEmpty) {
      data['title'] = title;
    }
    if (images != null && images!.isNotEmpty) {
      data['images'] = images;
    }
    if (description != null && description!.isNotEmpty) {
      data['description'] = description;
    }
    if (event != null && event!.isNotEmpty) {
      data['event'] = event;
    } else {
      data['event'] = 'Other';
    }
    if (date != null && date!.isNotEmpty) {
      data['date'] = date;
    }
    if (personalDetailsId != null && personalDetailsId!.isNotEmpty) {
      data['personal_details_id'] = personalDetailsId;
    }
    if (bizcardId != null && bizcardId!.isNotEmpty) {
      data['bizcard_id'] = bizcardId;
    }
    if (personalAchievementId != null && personalAchievementId!.isNotEmpty) {
      data['personal_achievement_id'] = personalAchievementId;
    }
    return data;
  }
}
