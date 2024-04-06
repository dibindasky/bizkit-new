// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      enquiry: json['enquiry'] as bool?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..cardId = json['card_id'] as int?;

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'enquiry': instance.enquiry,
      'label': instance.label,
      'description': instance.description,
      'card_id': instance.cardId,
    };
