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
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
    if (businessDetailsId != null && businessDetailsId!.isNotEmpty) {
      data['business_details_id'] = businessDetailsId;
    }
    if (bizcardId != null && bizcardId!.isNotEmpty) {
      data['bizcard_id'] = bizcardId;
    }
    if (achievementId != null && achievementId!.isNotEmpty) {
      data['achievement_id'] = achievementId;
    }

    return data;
  }
}
