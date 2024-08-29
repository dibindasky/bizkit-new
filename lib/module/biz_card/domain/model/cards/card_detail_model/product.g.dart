// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  var imageList = json['images'];
  List<ImageCard>? imageCards;

  if (imageList is List) {
    imageCards = imageList.map((image) {
      // Create ImageCard from String
      return ImageCard(image: image as String);
    }).toList();
  }
  return Product(
    title: json['title'] as String?,
    images: imageCards,
    description: json['description'] as String?,
    enquiry: json['enquiry'] as bool?,
    id: json['_id'] as String?,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'title': instance.title,
      'images': instance.images,
      'description': instance.description,
      'enquiry': instance.enquiry,
      '_id': instance.id,
    };
