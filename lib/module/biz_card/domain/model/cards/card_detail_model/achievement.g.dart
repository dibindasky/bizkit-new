// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Achievement _$PersonalAchievementFromJson(Map<String, dynamic> json) {
  var imageList = json['images'];
  List<ImageCard>? imageCards;

  if (imageList is List) {
    imageCards = imageList.map((image) {
      // Create ImageCard from String
      return ImageCard(image: image as String);
    }).toList();
  }
  return Achievement(
    title: json['title'] as String?,
    images: imageCards,
    description: json['description'] as String?,
    event: json['event'] as String?,
    date: json['date'] as String?,
    id: json['_id'] as String?,
  );
}

Map<String, dynamic> _$PersonalAchievementToJson(Achievement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'images': instance.images,
      'description': instance.description,
      'event': instance.event,
      'date': instance.date,
      '_id': instance.id,
    };
