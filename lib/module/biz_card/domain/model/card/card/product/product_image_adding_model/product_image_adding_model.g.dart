// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_adding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImageAddingModel _$ProductImageAddingModelFromJson(
        Map<String, dynamic> json) =>
    ProductImageAddingModel(
      productId: json['product_id'] as int?,
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductImageAddingModelToJson(
        ProductImageAddingModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'image': instance.image,
    };