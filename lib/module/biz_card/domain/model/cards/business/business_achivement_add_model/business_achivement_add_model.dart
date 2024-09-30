class BusinessAchivementAddModel {
  String? title;
  List<String>? images;
  String? description;
  String? event;
  String? date;
  String? businessDetailsId;
  String? bizcardId;
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

  // Custom fromJson
  factory BusinessAchivementAddModel.fromJson(Map<String, dynamic> json) {
    return BusinessAchivementAddModel(
      title: json['title'] as String?,
      images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      event: json['event'] as String?,
      date: json['date'] as String?,
      businessDetailsId: json['business_details_id'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      achievementId: json['achievement_id'] as String?,
    );
  }

  // Custom toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    
    if (title != null) {
      data['title'] = title;
    }
    if (images != null) {
      data['images'] = images;
    }
    if (description != null) {
      data['description'] = description;
    }
    if (event != null) {
      data['event'] = event;
    }
    if (date != null) {
      data['date'] = date;
    }
    if (businessDetailsId != null) {
      data['business_details_id'] = businessDetailsId;
    }
    if (bizcardId != null) {
      data['bizcard_id'] = bizcardId;
    }
    if (achievementId != null) {
      data['achievement_id'] = achievementId;
    }
    return data;
  }
}
