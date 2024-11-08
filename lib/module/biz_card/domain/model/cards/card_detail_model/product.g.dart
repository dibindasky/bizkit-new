// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      title: json['title'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      enquiry: json['enquiry'] as bool?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'title': instance.title,
      'images': instance.images,
      'description': instance.description,
      'enquiry': instance.enquiry,
      '_id': instance.id,
    };
