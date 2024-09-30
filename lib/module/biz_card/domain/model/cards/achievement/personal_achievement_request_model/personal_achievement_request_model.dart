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
      images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      event: json['event'] as String?,
      date: json['date'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      personalDetailsId: json['personal_details_id'] as String?,
      personalAchievementId: json['personal_achievement_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    
    if (title != null) {
      data['title'] = title;
    }
    if (description != null) {
      data['description'] = description;
    }
    if (images != null) {
      data['images'] = images;
    }
    if (event != null) {
      data['event'] = event;
    }
    if (date != null) {
      data['date'] = date;
    }
    if (bizcardId != null) {
      data['bizcard_id'] = bizcardId;
    }
    if (personalDetailsId != null) {
      data['personal_details_id'] = personalDetailsId;
    }
    if (personalAchievementId != null) {
      data['personal_achievement_id'] = personalAchievementId;
    }

    return data;
  }
}
